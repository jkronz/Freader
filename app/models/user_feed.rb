class UserFeed < ActiveRecord::Base
  attr_accessible :feed_id, :user_id

  belongs_to :user
  belongs_to :feed
  has_many :user_feed_articles
  has_many :articles, :through => :user_feed_articles
end
