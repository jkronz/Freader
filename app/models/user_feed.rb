class UserFeed < ActiveRecord::Base
  attr_accessible :feed, :user

  belongs_to :user
  belongs_to :feed
  has_many :user_feed_articles
  has_many :articles, :through => :user_feed_articles

  def unread_articles
    self.user_feed_articles.where("read = false or keep_unread = true")
  end

  def as_json(options={})
    super(options).merge({
      :unread_articles_count => self.unread_articles.count,
      :url => self.feed.url,
      :name => self.feed.name
    })
  end
end
