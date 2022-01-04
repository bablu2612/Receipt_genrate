# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_10_064919) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "order_id"
    t.string "payment_method"
    t.integer "receipt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receipt_id"], name: "index_customers_on_receipt_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "qty"
    t.string "cost"
    t.integer "receipt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receipt_id"], name: "index_items_on_receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "vat_id"
    t.string "business_id"
    t.integer "receipt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receipt_id"], name: "index_sellers_on_receipt_id"
  end

  add_foreign_key "customers", "receipts"
  add_foreign_key "items", "receipts"
  add_foreign_key "sellers", "receipts"
end
