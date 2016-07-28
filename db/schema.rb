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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160727013842) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "articles", force: :cascade do |t|
    t.text     "title",       limit: 65535
    t.text     "description", limit: 65535
    t.integer  "view",        limit: 4
    t.string   "source",      limit: 255
    t.string   "link_source", limit: 255
    t.string   "image",       limit: 255
    t.integer  "state",       limit: 4,     default: 2
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "image",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "category_articles", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.integer  "article_id",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "category_articles", ["article_id"], name: "index_category_articles_on_article_id", using: :btree
  add_index "category_articles", ["category_id"], name: "index_category_articles_on_category_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "list_articles", force: :cascade do |t|
    t.integer  "list_id",    limit: 4
    t.integer  "article_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "list_articles", ["article_id"], name: "index_list_articles_on_article_id", using: :btree
  add_index "list_articles", ["list_id"], name: "index_list_articles_on_list_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "image",       limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "lists", ["category_id"], name: "index_lists_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "username",               limit: 255
    t.string   "nickname",               limit: 255
    t.string   "image",                  limit: 255
    t.integer  "role",                   limit: 4,   default: 1
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "web_details", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "address",     limit: 255
    t.string   "email",       limit: 255
    t.string   "telephone",   limit: 255
    t.string   "image",       limit: 255
    t.string   "fb_page",     limit: 255
    t.string   "google_plus", limit: 255
    t.string   "tweatter",    limit: 255
    t.string   "youtube",     limit: 255
    t.string   "instagram",   limit: 255
    t.text     "about_us",    limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "articles", "users"
  add_foreign_key "category_articles", "articles"
  add_foreign_key "category_articles", "categories"
  add_foreign_key "list_articles", "articles"
  add_foreign_key "list_articles", "lists"
  add_foreign_key "lists", "categories"
end
