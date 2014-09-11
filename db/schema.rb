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

ActiveRecord::Schema.define(version: 20140908214128) do

  create_table "action_cards", force: true do |t|
    t.boolean  "played"
    t.boolean  "discarded"
    t.integer  "hand_id"
    t.integer  "game_instance_id"
    t.string   "name"
    t.string   "json"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_instances", force: true do |t|
    t.integer  "root_card"
    t.string   "deck_name"
    t.string   "name"
    t.integer  "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goal_cards", force: true do |t|
    t.string   "card_name"
    t.integer  "hand_id"
    t.integer  "game_instance_id"
    t.string    "json"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hands", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_instance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "path_cards", force: true do |t|
    t.boolean  "played"
    t.boolean  "discarded"
    t.boolean  "flipped"
    t.boolean  "locked"
    t.integer  "hand_id"
    t.string   "card_name"
    t.integer  "game_instance_id"
    t.integer  "up_slot"
    t.integer  "down_slot"
    t.integer  "left_slot"
    t.integer  "right_slot"
    t.string   "json"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", force: true do |t|
    t.integer  "game_instance_id"
    t.string   "action"
    t.string   "player"
    t.integer  "sequence"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
