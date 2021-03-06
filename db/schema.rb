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

ActiveRecord::Schema.define(version: 20141021025715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: true do |t|
    t.date     "date"
    t.integer  "terrace_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["terrace_id"], name: "index_availabilities_on_terrace_id", using: :btree

  create_table "owners", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terraces", force: true do |t|
    t.integer  "owner_id"
    t.decimal  "rent"
    t.decimal  "area"
    t.string   "location"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "terraces", ["owner_id"], name: "index_terraces_on_owner_id", using: :btree

end
