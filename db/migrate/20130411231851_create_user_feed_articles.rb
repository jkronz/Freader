class CreateUserFeedArticles < ActiveRecord::Migration
  def change
    create_table :user_feed_articles do |t|
      t.integer :user_feed_id
      t.integer :article_id
      t.boolean :read
      t.boolean :keep_unread

      t.timestamps
    end
  end
end
