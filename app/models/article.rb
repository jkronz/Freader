class Article < ActiveRecord::Base
  attr_accessible :author, :content, :feed_id, :published_at, :summary, :title

  belongs_to :feed
end
