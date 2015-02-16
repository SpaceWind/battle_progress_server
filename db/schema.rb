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

ActiveRecord::Schema.define(version: 20150216132451) do

  create_table "active_keys", force: true do |t|
    t.string   "apikey"
    t.string   "login"
    t.datetime "last_updated"
    t.string   "heroid"
    t.datetime "last_controlled"
    t.string   "rolled_heroid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hero_descriptors", force: true do |t|
    t.string   "heroid"
    t.string   "name"
    t.integer  "lvl"
    t.integer  "mood"
    t.text     "map"
    t.integer  "pack_max_size"
    t.integer  "exp"
    t.integer  "exp_to_next_lvl"
    t.integer  "x"
    t.integer  "y"
    t.string   "class"
    t.string   "race"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hero_descs", force: true do |t|
    t.string   "heroid"
    t.string   "name"
    t.integer  "lvl"
    t.integer  "mood"
    t.integer  "pack_max_size"
    t.integer  "exp"
    t.integer  "exp_to_next_lvl"
    t.integer  "x"
    t.integer  "y"
    t.string   "class"
    t.string   "race"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_x_heros", force: true do |t|
    t.string   "login"
    t.string   "heroid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
