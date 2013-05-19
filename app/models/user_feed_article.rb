class UserFeedArticle < ActiveRecord::Base
  attr_accessible :article, :keep_unread, :read, :user_feed, :favorite

  belongs_to :user_feed
  belongs_to :article

  def as_json(options={})
    ret = super(options).merge(self.article.as_json())
    ret[:id] = self.id
    ret
  end
end
