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

ActiveRecord::Schema.define(version: 2018_09_23_193519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plans", force: :cascade do |t|
    t.decimal "price"
    t.string "name"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", id: :serial, force: :cascade do |t|
    t.string "email"
    t.integer "amount"
    t.string "description"
    t.string "currency"
    t.string "customer_id"
    t.string "card"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postcode"
    t.string "mobile_number"
    t.string "deliverAddress"
    t.string "deliverName"
    t.string "deliverNumber"
    t.string "frequency"
    t.string "size"
    t.string "delivery"
    t.date "start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "card_token"
    t.string "plan"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end