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

ActiveRecord::Schema.define(version: 20150227074335) do

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

  create_table "clan_relations", force: true do |t|
    t.string   "rel_type"
    t.string   "rel_name"
    t.text     "hostile"
    t.text     "friendly"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_specs", force: true do |t|
    t.string   "class_name"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "mag"
    t.integer  "int"
    t.integer  "tra"
    t.integer  "vel"
    t.integer  "hp"
    t.integer  "mana"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factions", force: true do |t|
    t.string   "faction_name"
    t.string   "lib_imp"
    t.string   "lib_rop"
    t.string   "lib_dap"
    t.string   "lib_vip"
    t.string   "lib_tvp"
    t.string   "lib_prp"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "h_descriptors", force: true do |t|
    t.string   "hid"
    t.string   "hero_name"
    t.integer  "mood"
    t.integer  "lvl"
    t.text     "map"
    t.integer  "pack_max_size"
    t.integer  "experience"
    t.integer  "exp_to_next_lvl"
    t.integer  "x_pos"
    t.integer  "y_pos"
    t.string   "hclass"
    t.string   "hrace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hero_stats", force: true do |t|
    t.string   "heroid"
    t.integer  "str"
    t.integer  "dex"
    t.integer  "mag"
    t.integer  "int"
    t.integer  "tra"
    t.integer  "vel"
    t.integer  "max_hp"
    t.integer  "max_mana"
    t.integer  "current_hp"
    t.integer  "current_mana"
    t.integer  "start_str"
    t.integer  "start_dex"
    t.integer  "start_mag"
    t.integer  "start_int"
    t.integer  "start_vel"
    t.integer  "start_hp"
    t.integer  "start_mana"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "libs", force: true do |t|
    t.string   "token"
    t.string   "item"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "person_name"
    t.string   "lib_imp"
    t.string   "lib_rop"
    t.string   "lib_dap"
    t.string   "lib_vip"
    t.string   "lib_tvp"
    t.string   "lib_prp"
    t.text     "description"
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
    t.string   "realname"
    t.string   "group"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
