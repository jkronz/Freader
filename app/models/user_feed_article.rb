class UserFeedArticle < ActiveRecord::Base
  attr_accessible :article, :keep_unread, :read, :user_feed

  belongs_to :user_feed
  belongs_to :article
end
