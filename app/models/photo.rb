class Photo
  include Mongoid::Document
  
  field :title, type: String
  field :external_url, type: String
  field :thumbnail_url, type: String
  field :flickr, type: Boolean  

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
    self.update_flickr
  end

  def self.update_flickr
    self.all.each do |p|
      p.flickr ? p.destroy : false
    end
    self.flickr_input( "481553@N21" )
    self.flickr_input( "92517064@N00" )
  end

  def self.flickr_input( group_id )
    FlickRaw.api_key="0b5f55a64a8c18a5b8087aeb77573cd2"
    FlickRaw.shared_secret="abd4529ea1ac3ddb"
    group_feed = flickr.groups.pools.getPhotos( group_id: group_id )
    group_feed.each do |p|
      Photo.create( title: p.title, external_url: FlickRaw.url_photopage(p), thumbnail_url: FlickRaw.url_q(p), flickr: true )
    end
  end

end
