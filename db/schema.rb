# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170708013117) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "home_listing_id"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip_code"
  end

  add_index "addresses", ["home_listing_id"], name: "index_addresses_on_home_listing_id"

  create_table "booking_requests", force: :cascade do |t|
    t.integer  "home_listing_id"
    t.integer  "tenant_id"
    t.date     "checkin",                        null: false
    t.date     "checkout",                       null: false
    t.integer  "party_size"
    t.boolean  "pending",         default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "booking_requests", ["home_listing_id"], name: "index_booking_requests_on_home_listing_id"
  add_index "booking_requests", ["tenant_id"], name: "index_booking_requests_on_tenant_id"

  create_table "home_listings", force: :cascade do |t|
    t.string   "title"
    t.integer  "capacity"
    t.float    "bathrooms"
    t.integer  "bedrooms"
    t.time     "checkin"
    t.time     "checkout"
    t.text     "rules"
    t.integer  "security_deposit"
    t.integer  "cleaning_fee"
    t.integer  "extra_person_fee"
    t.text     "amenities",               default: "--- []\n"
    t.integer  "min_stay"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.text     "about"
    t.integer  "lessor_id"
    t.string   "place_type"
    t.integer  "party_size"
    t.string   "place"
    t.string   "property_type"
    t.string   "accommodation_situation"
    t.integer  "beds"
    t.text     "shared_spaces",           default: "--- []\n"
    t.text     "summary"
    t.string   "good_for"
    t.integer  "price"
    t.string   "photos"
  end

  add_index "home_listings", ["lessor_id"], name: "index_home_listings_on_lessor_id"

  create_table "lessors", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lessors", ["user_id"], name: "index_lessors_on_user_id"

  create_table "tenants", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tenants", ["user_id"], name: "index_tenants_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
