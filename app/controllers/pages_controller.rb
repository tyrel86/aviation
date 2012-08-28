class PagesController < ApplicationController
  
  def home
		@feeds = Feed.all
		@scots_picks = Story.all
		@vod = Video.first #Video of the day
		@contact = Contact.new
  end
  
	def story
	  feed = Feed.find( params[:feed_id] )
		article = feed.articles.find( params[:article_id] )
    article.increment_clicks
    
    redirect_to article.url
	end

	def info
	
	end

	def story_no_click
		article = Story.find( params[:article_id] )
		redirect_to article.url
	end


	def snatcher
		if params[:url] == "one"
			url = "http://aviationweather.gov"
		else
			url = "http://weather.unisys.com/images/sat_sfc_map_loop.php"
		end
		render :text => (`wget -qO- #{url}`)
	end	
end
