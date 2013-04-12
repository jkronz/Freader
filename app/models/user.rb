class User < ActiveRecord::Base
  before_save :create_remember_token
  attr_accessible :email, :remember_token

  has_many :user_feeds, :dependent => :destroy
  has_many :feeds, :through => :user_feeds
  has_many :user_feed_articles, :through => :user_feeds

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
