class Feed < ActiveRecord::Base
  attr_accessible :etag, :feed_url, :last_modified, :name, :url

  has_many :user_feeds, :dependent => :destroy
  has_many :articles, :dependent => :destroy

end
