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

ActiveRecord::Schema[7.1].define(version: 2024_11_11_203757) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documentations", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "name", null: false
    t.boolean "favorite", default: false, null: false
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_documentations_on_client_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "name"
    t.string "country"
    t.string "state_province"
    t.string "zip_code"
    t.string "street"
    t.string "street_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.index ["client_id"], name: "index_locations_on_client_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_rooms_on_location_id"
  end

  create_table "rows", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.string "name", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_rows_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "documentation_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documentation_id"], name: "index_sections_on_documentation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "role", default: "assistant", null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.bigint "row_id", null: false
    t.text "content"
    t.boolean "favorite", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["row_id"], name: "index_values_on_row_id"
  end

  add_foreign_key "documentations", "clients"
  add_foreign_key "locations", "clients"
  add_foreign_key "rooms", "locations"
  add_foreign_key "rows", "sections"
  add_foreign_key "sections", "documentations"
  add_foreign_key "users", "clients"
  add_foreign_key "values", "rows"
end
