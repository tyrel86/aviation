namespace :twitter do

desc "Post a tweet showing a recent top story"
task top: :environment do  
  Twitter.configure do |config|
    config.consumer_key = "X3ZW4rzbVUlioaJpY1rkA"
    config.consumer_secret = "8vjH3odMiIJRNgwslmEFCkxgR6GtBJ1W7Ohe6n1oY"
    config.oauth_token = "633666666-kyUuWPPCpvOuRTbQIDcZjAV730BTdqYcOdOZG9Fh"
    config.oauth_token_secret = "paEF1nWeRd0FnbeIf4gX4tlF9IjWqdkCsgm8p33lM"
  end
  story = Article.top_stories(10).sample
  Twitter.update("#{story.title} #{story.url}")
end

desc "Post a tweet showing a new story"
task new: :environment do  
  Twitter.configure do |config|
    config.consumer_key = "X3ZW4rzbVUlioaJpY1rkA"
    config.consumer_secret = "8vjH3odMiIJRNgwslmEFCkxgR6GtBJ1W7Ohe6n1oY"
    config.oauth_token = "633666666-kyUuWPPCpvOuRTbQIDcZjAV730BTdqYcOdOZG9Fh"
    config.oauth_token_secret = "paEF1nWeRd0FnbeIf4gX4tlF9IjWqdkCsgm8p33lM"
  end
  story = Article.newest_stories.sample
  Twitter.update("#{story.title} #{story.url}")
end

end
