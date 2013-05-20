class User < ActiveRecord::Base
  before_save :create_remember_token
  attr_accessible :email, :remember_token

  has_many :user_feeds, :dependent => :destroy
  has_many :feeds, :through => :user_feeds
  has_many :user_feed_articles, :through => :user_feeds

  def create_feed(url)
    remote_feed = Feedzirra::Feed.fetch_and_parse(url)
    local_feed = Feed.create(name: remote_feed.title, url: remote_feed.url, feed_url: remote_feed.feed_url, etag: remote_feed.etag, last_modified: remote_feed.last_modified)
    user_feed = self.user_feeds.create(feed: local_feed)
    remote_feed.sanitize_entries!
    remote_feed.entries[0..9].each do |entry|
      article = local_feed.articles.create(title: entry.title,
                             author: entry.author,
                             url: entry.url,
                             summary: entry.summary,
                             content: entry.content,
                             published_at: entry.published)
      user_feed.user_feed_articles.create(article: article, read: false, keep_unread: false)
    end
    user_feed
  end

  def articles(params)
    articles_rel = user_feed_articles
    articles_rel = articles_rel.joins(:article)
    if params[:user_feed_id].present?
      articles_rel = articles_rel.where(:user_feed_id => params[:user_feed_id])
    end
    if params[:unread]
      articles_rel = articles_rel.where('read is false or keep_unread is true')
    end

    articles_rel.order('articles.published_at desc')
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
