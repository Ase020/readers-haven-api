ActiveRecord::Schema[7.0].define(version: 2023_07_04_200353) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_publishers", force: :cascade do |t|
    t.integer "author_id"
    t.integer "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

