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

ActiveRecord::Schema.define(version: 20180505222558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "number"
    t.decimal "value"
    t.string "description"
    t.bigint "person_id"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "competence"
    t.index ["person_id"], name: "index_expenses_on_person_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "name"
    t.boolean "money"
    t.boolean "card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provisions", force: :cascade do |t|
    t.bigint "category_id"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "used", default: "0.0"
    t.index ["category_id"], name: "index_provisions_on_category_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "number"
    t.decimal "value"
    t.string "description"
    t.boolean "closed"
    t.bigint "person_id"
    t.bigint "payment_id"
    t.bigint "expense_id"
    t.boolean "recipe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.date "date"
    t.index ["category_id"], name: "index_recipes_on_category_id"
    t.index ["expense_id"], name: "index_recipes_on_expense_id"
    t.index ["payment_id"], name: "index_recipes_on_payment_id"
    t.index ["person_id"], name: "index_recipes_on_person_id"
  end

  create_table "spents", force: :cascade do |t|
    t.string "number"
    t.decimal "value"
    t.string "description"
    t.boolean "closed"
    t.bigint "person_id"
    t.bigint "payment_id"
    t.bigint "expense_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_spents_on_category_id"
    t.index ["expense_id"], name: "index_spents_on_expense_id"
    t.index ["payment_id"], name: "index_spents_on_payment_id"
    t.index ["person_id"], name: "index_spents_on_person_id"
  end

  add_foreign_key "expenses", "people"
  add_foreign_key "provisions", "categories"
  add_foreign_key "recipes", "categories"
  add_foreign_key "recipes", "expenses"
  add_foreign_key "recipes", "payments"
  add_foreign_key "recipes", "people"
  add_foreign_key "spents", "categories"
  add_foreign_key "spents", "expenses"
  add_foreign_key "spents", "payments"
  add_foreign_key "spents", "people"
end
