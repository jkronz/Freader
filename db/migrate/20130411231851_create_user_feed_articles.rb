class CreateUserFeedArticles < ActiveRecord::Migration
  def change
    create_table :user_feed_articles do |t|
      t.integer :user_feed_id
      t.integer :article_id
      t.boolean :read, :default => false
      t.boolean :keep_unread, :default => false

      t.timestamps
    end
    add_index :user_feed_articles, :user_feed_id
    add_index :user_feed_articles, :article_id
  end
end
