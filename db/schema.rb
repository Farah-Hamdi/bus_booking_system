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

ActiveRecord::Schema[7.1].define(version: 2024_07_21_195008) do
  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "seat_id", null: false
    t.integer "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seat_id"], name: "index_bookings_on_seat_id"
    t.index ["trip_id"], name: "index_bookings_on_trip_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "buses", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_buses_on_trip_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer "bus_id", null: false
    t.integer "seat_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_seats_on_bus_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "start_city_id", null: false
    t.integer "end_city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_city_id"], name: "index_trips_on_end_city_id"
    t.index ["start_city_id"], name: "index_trips_on_start_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "jti"
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "seats"
  add_foreign_key "bookings", "trips"
  add_foreign_key "bookings", "users"
  add_foreign_key "buses", "trips"
  add_foreign_key "seats", "buses"
  add_foreign_key "trips", "cities", column: "end_city_id"
  add_foreign_key "trips", "cities", column: "start_city_id"
end
