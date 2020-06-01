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

ActiveRecord::Schema.define(version: 2020_06_01_054145) do

  create_table "contents", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "quality_id", null: false
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_contents_on_film_id"
    t.index ["quality_id"], name: "index_contents_on_quality_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.text "plot"
    t.integer "number"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["created_at"], name: "index_films_on_created_at"
    t.index ["parent_id"], name: "index_films_on_parent_id"
    t.index ["type"], name: "index_films_on_type"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "content_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["content_id"], name: "index_purchases_on_content_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "qualities", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "contents", "films"
  add_foreign_key "contents", "qualities"
  add_foreign_key "films", "films", column: "parent_id"
  add_foreign_key "purchases", "contents"
  add_foreign_key "purchases", "users"
end
