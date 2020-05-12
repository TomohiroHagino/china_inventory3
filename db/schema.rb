# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_12_084906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buy_items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_number"
    t.string "item_title"
    t.string "item_picture"
    t.string "part_number"
    t.integer "jan_code"
    t.integer "simulate_price"
    t.boolean "yahoo"
    t.boolean "amazon"
    t.boolean "mercari"
    t.boolean "rakuma"
    t.boolean "rakuten"
    t.boolean "yahooshopping"
    t.string "buy_china_item_picture"
    t.string "buy_china_item_title"
    t.string "buy_china_item_url"
    t.string "sell_item_url"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_items_on_team_id"
  end

  create_table "researches", force: :cascade do |t|
    t.string "japan_image_url"
    t.string "japan_title"
    t.string "japan_url"
    t.string "japan_description"
    t.integer "japan_price"
    t.integer "jpn_research_check"
    t.string "china_image_url"
    t.string "china_title"
    t.string "china_url"
    t.float "china_price"
    t.integer "chn_research_check"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_researches_on_team_id"
  end

  create_table "take_inventories", force: :cascade do |t|
    t.date "fiscal_year"
    t.integer "beginning_product_inventory"
    t.integer "cost_of_sales"
    t.integer "period_end_product_inventory"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_take_inventories_on_user_id"
  end

  create_table "team_users", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_team_users_on_team_id"
    t.index ["user_id"], name: "index_team_users_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "admin_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "employee_number"
    t.string "line_id"
    t.string "email", null: false
    t.string "address", null: false
    t.string "phone_number"
    t.string "account_bank_name", default: "1", null: false
    t.integer "account_number", default: 1, null: false
    t.integer "business_expenses", default: 1, null: false
    t.string "password_digest", null: false
    t.boolean "inventory_manager_flg", default: false, null: false
    t.boolean "reserch_user_flg", default: false, null: false
    t.boolean "owner_flg", default: false, null: false
    t.boolean "fired_flg", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.string "remember_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_user_id"
    t.string "avatar"
    t.index ["team_user_id"], name: "index_users_on_team_user_id"
  end

  add_foreign_key "items", "teams"
  add_foreign_key "researches", "teams"
  add_foreign_key "take_inventories", "users"
  add_foreign_key "team_users", "teams"
  add_foreign_key "team_users", "users"
  add_foreign_key "users", "team_users"
end
