class Feed
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  field :order, type: Integer

	#Relations
	embeds_many :articles	
	
	#Updates each feeds embeded articles to current state
	def self.update_all
		self.all.each do |feed|
			feed.fetch_articles
			feed.remove_depricated
		end
	end

	#If any new articles are present on feed add them to embeded articles
	def fetch_articles
    current_feed = get_rss_feed( self.url )
    current_feed.entries.each do |article|
        unless self.array_of_article_urls.include?(article.url)
          a = Article.new(title: article.title, url: article.url, clicks: 0)
          a.title ||= article.summary
          self.articles.push a   
        end
    end
	end

  def array_of_article_urls
    self.articles.inject([]) do |articles, article|
      articles.push( article.url )  
    end  
  end

  #Removes all 3 days or older articles from emeded articles
	def remove_depricated
      self.articles.each do |a|
        unless ((a.created_at + 3.days) > Date.today)          
          self.articles.delete(a)
        end
      end
	end

  #Obtains an instance of Feedzirra for a URL
  def get_rss_feed( rss_url )
		feed = false
		until feed.class == Feedzirra::Parser::RSS
			feed = Feedzirra::Feed.fetch_and_parse( rss_url )
		end
		feed
	end

end
