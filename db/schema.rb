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

ActiveRecord::Schema.define(version: 20140818235245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "uniq_game_id"
    t.integer  "bracket_id"
    t.integer  "bracket_game_id"
    t.integer  "winner_id"
    t.boolean  "in_bracket"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teams",           default: [], array: true
  end

  create_table "teams", force: true do |t|
    t.string   "pos"
    t.string   "seed"
    t.string   "school"
    t.string   "off_eff"
    t.string   "def_eff"
    t.string   "tempo"
    t.string   "off_efg"
    t.string   "def_efg"
    t.string   "off_turnover"
    t.string   "def_turnover"
    t.string   "off_reb"
    t.string   "def_reb"
    t.string   "off_fta_rate"
    t.string   "def_fta_rate"
    t.string   "off_three_point_pct"
    t.string   "def_three_point_pct"
    t.string   "off_two_point_pct"
    t.string   "def_two_point_pct"
    t.string   "off_ft_pct"
    t.string   "def_ft_pct"
    t.string   "off_block_pct"
    t.string   "def_block_pct"
    t.string   "off_steal_pct"
    t.string   "def_steal_pct"
    t.string   "off_3pa_per_fga"
    t.string   "def_3pa_per_fga"
    t.string   "off_assist_rate"
    t.string   "def_assist_rate"
    t.string   "off_3_point_dist"
    t.string   "def_3_point_dist"
    t.string   "off_2_point_dist"
    t.string   "def_2_point_dist"
    t.string   "off_ft_point_dist"
    t.string   "def_ft_point_dist"
    t.string   "sos"
    t.string   "bench_minutes"
    t.string   "experience"
    t.string   "effective_height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "games",               default: [], array: true
    t.integer  "game_id"
  end

end
