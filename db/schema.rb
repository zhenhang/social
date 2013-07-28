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

ActiveRecord::Schema.define(:version => 20130724064717) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.string   "state"
    t.integer  "rate"
    t.text     "content"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id"
    t.integer  "floor",       :default => 0
  end

  create_table "articles", :force => true do |t|
    t.integer  "user_id"
    t.string   "state"
    t.integer  "rate"
    t.string   "title"
    t.text     "content"
    t.integer  "page_view"
    t.string   "tags"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "uid"
    t.string   "provider"
    t.string   "access_token"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "favs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.string   "kind"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "target_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gists", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "nodes", :force => true do |t|
    t.string   "title"
    t.string   "summary"
    t.integer  "sort"
    t.string   "kind"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "user_id"
    t.string   "state"
    t.integer  "rate"
    t.string   "title"
    t.text     "content"
    t.integer  "page_view"
    t.string   "tags"
    t.datetime "replied_at"
    t.integer  "selected_id"
    t.datetime "due_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "replies", :force => true do |t|
    t.integer  "user_id"
    t.string   "state"
    t.integer  "rate"
    t.text     "content"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "floor",          :default => 0
    t.integer  "repliable_id"
    t.string   "repliable_type"
  end

  create_table "shares", :force => true do |t|
    t.integer  "user_id"
    t.string   "state"
    t.integer  "rate"
    t.string   "title"
    t.text     "content"
    t.integer  "page_view"
    t.integer  "download_count"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "node"
    t.string   "tags"
    t.integer  "last_reply_id"
    t.string   "last_reply_user_name"
    t.datetime "replied_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "sites", :force => true do |t|
    t.string   "title"
    t.string   "intro"
    t.string   "url"
    t.string   "logo"
    t.integer  "node_count"
    t.integer  "user_count"
    t.integer  "topic_count"
    t.integer  "reply_count"
    t.string   "nav",          :limit => 2047
    t.string   "notice"
    t.string   "hot_node"
    t.integer  "top_topic_id"
    t.string   "ad"
    t.string   "state"
    t.string   "config"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "topics", :force => true do |t|
    t.integer  "user_id"
    t.string   "state"
    t.integer  "rate"
    t.string   "title"
    t.text     "content"
    t.integer  "page_view"
    t.string   "node"
    t.string   "tags"
    t.integer  "last_reply_id"
    t.string   "last_reply_user_name"
    t.datetime "replied_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "username",               :default => "",       :null => false
    t.string   "saying",                 :default => ""
    t.string   "location",               :default => ""
    t.string   "sex",                    :default => "male"
    t.float    "rate",                   :default => 0.0,      :null => false
    t.string   "state",                  :default => "normal", :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
