class PagesController < ApplicationController
  
  def home
		@feeds = Feed.all
  end
  
	def story
	  feed = Feed.find( params[:feed_id] )
		article = feed.articles.find( params[:article_id] )
    article.increment_clicks
    
    redirect_to article.url
	end
	
end
