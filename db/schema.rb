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

ActiveRecord::Schema.define(version: 20160927085957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_invoices", force: :cascade do |t|
    t.integer  "ref_id"
    t.string   "action"
    t.string   "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "lang"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "hr_expenses", force: :cascade do |t|
    t.string   "db"
    t.integer  "ref_id"
    t.string   "action"
    t.string   "post_json"
    t.string   "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_tests", id: false, force: :cascade do |t|
    t.integer "test_id",    null: false
    t.integer "product_id", null: false
    t.index ["product_id", "test_id"], name: "index_products_tests_on_product_id_and_test_id", using: :btree
    t.index ["test_id", "product_id"], name: "index_products_tests_on_test_id_and_product_id", using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "part_number"
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
