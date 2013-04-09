class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :summary
      t.text :content
      t.date :published_at
      t.boolean :read
      t.integer :feed_id, :null => false
      t.timestamps
    end

    add_index :articles, :feed_id
  end
end
