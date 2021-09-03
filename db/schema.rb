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

ActiveRecord::Schema.define(version: 2021_09_03_120203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "my_property_listings", force: :cascade do |t|
    t.string "title"
    t.string "lot_area"
    t.string "floor_area"
    t.string "location_name"
    t.string "location_address"
    t.float "latitude"
    t.float "longitude"
    t.string "bedroom_count"
    t.string "bathroom_count"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "birthday_date"
    t.string "prc_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
