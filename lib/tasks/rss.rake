namespace :rss do
 
  desc "Checks all feeds in database and adds new stories if present and removes 3 day old stories if pressent"
  task update: :environment do
	  Feed.update_all
	  Photo.update_database
  end

end
