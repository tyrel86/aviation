class Photo
  include Mongoid::Document
  
  field :title, type: String
  field :external_url, type: String
  field :thumbnail_url, type: String
  
  def self.get_photo_feed
    feed = false
    until feed.class == Feedzirra::Parser::RSS
      feed = Feedzirra::Feed.fetch_and_parse( "http://airjeff.smugmug.com/hack/feed.mg?Type=nicknameRecentPhotos&Data=airjeff&format=rss200" )
    end
    feed
  end

  def self.update_database
    feed = self.get_photo_feed
    keep_array = []
    feed.entries.each do |p|
      np = Photo.create( title: p.title, external_url: p.url, thumbnail_url: p.entry_id )
      keep_array += [np._id]
    end
    Photo.each do |p|
      p.destroy unless keep_array.include? p._id
    end
    until Photo.all.size <= 21
      Photo.all.sample.destroy
    end
  end

end
