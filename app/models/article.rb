class Article < ActiveRecord::Base
  attr_accessible :author, :url, :content, :feed, :published_at, :summary, :title

  belongs_to :user_feed_article
  belongs_to :feed
end
