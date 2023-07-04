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

ActiveRecord::Schema[7.0].define(version: 2023_07_04_200353) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_publishers", force: :cascade do |t|
    t.integer "author_id"
    t.integer "publisher_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "email"
    t.string "nationality"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.text "description"
    t.integer "publish_date"
    t.integer "price"
    t.integer "author_id"
    t.integer "user_id"
    t.integer "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poster_url"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "star_rating"
    t.text "description"
    t.integer "book_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
