class UserFeedArticle < ActiveRecord::Base
  attr_accessible :article_id, :keep_unread, :read, :user_feed_id

  belongs_to :user_feed
  belongs_to :article
end
