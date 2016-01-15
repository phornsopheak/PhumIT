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

ActiveRecord::Schema.define(version: 20160108080400) do

  create_table "articles", force: :cascade do |t|
    t.text     "title",       limit: 65535
    t.text     "description", limit: 65535
    t.integer  "view",        limit: 4
    t.text     "source",      limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
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
    t.integer  "category_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "lists", ["category_id"], name: "index_lists_on_category_id", using: :btree

  add_foreign_key "category_articles", "articles"
  add_foreign_key "category_articles", "categories"
  add_foreign_key "list_articles", "articles"
  add_foreign_key "list_articles", "lists"
  add_foreign_key "lists", "categories"
end
