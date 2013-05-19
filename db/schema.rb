# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130519122847) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "summary"
    t.text     "content"
    t.date     "published_at"
    t.integer  "feed_id",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "url"
  end

  add_index "articles", ["feed_id"], :name => "index_articles_on_feed_id"

  create_table "feeds", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "feed_url"
    t.string   "etag"
    t.time     "last_modified"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "user_feed_articles", :force => true do |t|
    t.integer  "user_feed_id"
    t.integer  "article_id"
    t.boolean  "read",         :default => false
    t.boolean  "keep_unread",  :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "favorite",     :default => false
  end

  add_index "user_feed_articles", ["article_id"], :name => "index_user_feed_articles_on_article_id"
  add_index "user_feed_articles", ["user_feed_id"], :name => "index_user_feed_articles_on_user_feed_id"

  create_table "user_feeds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "feed_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_feeds", ["feed_id"], :name => "index_user_feeds_on_feed_id"
  add_index "user_feeds", ["user_id"], :name => "index_user_feeds_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "remember_token"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
