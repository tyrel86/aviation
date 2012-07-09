class Article
  include Mongoid::Document
	include Mongoid::Timestamps
  field :title, type: String
  field :url, type: String
  field :clicks, type: Integer

	embedded_in :feed

  def increment_clicks
    self.clicks += 1
    self.save
  end
  
  def self.all_imbeded
    Feed.all.inject([]) do |articles, feed|
      articles += feed.articles.map { |article| article }
    end
  end
  
  def self.top_stories(x)
    #Get a list of all articles sorted by number of clicks hight to low
    orderd_articles = self.all_imbeded.sort_by! {|article| -article.clicks}
    (x = orderd_articles.size - 1) if ( x > orderd_articles.size)
    top_stories = orderd_articles[0..x]
    top_stories.select! {|e| e.clicks > 0}
    return top_stories if top_stories.size == x
    top_stories.each do |a|
      orderd_articles.delete_at(orderd_articles.index(a) || orderd_articles.length)
    end
    num_of_stories_to_add = x - top_stories.size
    num_of_stories_to_add.times do
      article_to_add = orderd_articles.sample
      orderd_articles.delete_at(orderd_articles.index(article_to_add) || orderd_articles.length)
      top_stories.push( article_to_add )
    end
    return top_stories
  end

end
