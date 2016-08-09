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

ActiveRecord::Schema.define(version: 20160808165503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "headings", force: :cascade do |t|
    t.integer  "web_page_id"
    t.string   "heading_type"
    t.string   "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["web_page_id"], name: "index_headings_on_web_page_id", using: :btree
  end

  create_table "links", force: :cascade do |t|
    t.integer  "web_page_id"
    t.text     "href"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["web_page_id"], name: "index_links_on_web_page_id", using: :btree
  end

  create_table "web_pages", force: :cascade do |t|
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.index ["url"], name: "index_web_pages_on_url", using: :btree
  end

  add_foreign_key "headings", "web_pages"
  add_foreign_key "links", "web_pages"
end
