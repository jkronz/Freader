class Feed < ActiveRecord::Base
  attr_accessible :etag, :feed_url, :last_modified, :name, :url

  belongs_to :user
  has_many :articles, :dependent => :destroy

  class << self
    def create_feed(url, user)
      feed = Feedzirra::Feed.fetch_and_parse(url)
      l_feed = user.feeds.create(name: feed.title, url: feed.url, feed_url: feed.feed_url, etag: feed.etag, last_modified: feed.last_modified)
      feed.sanitize_entries!
      feed.entries[0..9].each do |entry|
        l_feed.articles.create(title: entry.title,
                               author: entry.author,
                               summary: entry.summary,
                               content: entry.content,
                               published_at: entry.published)
      end
      l_feed
    end
  end
end
