class AddFavoriteToUserFeedArticle < ActiveRecord::Migration
  def change
    add_column :user_feed_articles, :favorite, :boolean, :default => false
  end
end
