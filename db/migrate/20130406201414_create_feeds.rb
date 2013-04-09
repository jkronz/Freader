class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :url
      t.string :feed_url
      t.string :etag
      t.time :last_modified
      t.integer :user_id
      t.timestamps
    end
  end
end
