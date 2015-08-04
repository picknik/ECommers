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

ActiveRecord::Schema.define(version: 20150804141426) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "categories_products", ["category_id"], name: "index_categories_products_on_category_id"
  add_index "categories_products", ["product_id"], name: "index_categories_products_on_product_id"

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.integer  "price"
  end

  create_table "orders", force: :cascade do |t|
    t.date     "required_date"
    t.date     "shipped_date"
    t.string   "city"
    t.string   "address"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.boolean  "accepted"
    t.boolean  "shipped"
    t.boolean  "cancelled"
    t.boolean  "delivered"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                       null: false
    t.integer  "units_in_stock"
    t.integer  "units_on_order", default: 1
    t.float    "price",                      null: false
    t.float    "discount"
    t.integer  "reorder_level",  default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "contact_title"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.string   "phone"
    t.string   "skype"
    t.string   "fax"
    t.string   "home_page"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

end
