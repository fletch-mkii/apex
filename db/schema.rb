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

ActiveRecord::Schema.define(version: 20160121220143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "histories", force: :cascade do |t|
    t.integer  "user_id",              null: false
    t.integer  "star_id",              null: false
    t.string   "observation_location", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "histories", ["star_id"], name: "index_histories_on_star_id", using: :btree
  add_index "histories", ["user_id"], name: "index_histories_on_user_id", using: :btree

  create_table "planets", force: :cascade do |t|
    t.string  "planet_name",          null: false
    t.float   "temperature"
    t.float   "orbital_period"
    t.float   "orbital_eccentricity"
    t.float   "mass"
    t.float   "radius"
    t.float   "density"
    t.string  "discovery_method"
    t.boolean "transits"
    t.integer "star_id",              null: false
  end

  add_index "planets", ["star_id"], name: "index_planets_on_star_id", using: :btree

  create_table "stars", force: :cascade do |t|
    t.string "star_name",       null: false
    t.float  "right_ascension", null: false
    t.float  "declination",     null: false
    t.float  "distance"
    t.float  "temperature"
    t.float  "stellar_age"
    t.float  "stellar_mass"
    t.float  "stellar_radius"
    t.string "spectral_type"
    t.float  "density"
    t.float  "surface_gravity"
    t.float  "luminosity"
  end

  add_index "stars", ["declination", "right_ascension"], name: "index_stars_on_declination_and_right_ascension", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
