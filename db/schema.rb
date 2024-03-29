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

ActiveRecord::Schema.define(:version => 20120627014221) do

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "languages", ["name"], :name => "index_languages_on_name", :unique => true

  create_table "reviews", :force => true do |t|
    t.string   "contents"
    t.integer  "line"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "snippet_id"
  end

  add_index "reviews", ["snippet_id"], :name => "index_reviews_on_snippet_id"
  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

  create_table "snippets", :force => true do |t|
    t.integer  "user_id"
    t.string   "code"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "language_id"
    t.string   "description"
  end

  add_index "snippets", ["user_id", "created_at"], :name => "index_snippets_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
