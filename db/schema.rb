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

ActiveRecord::Schema.define(version: 20141116205320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "averages", force: true do |t|
    t.string   "eff"
    t.string   "tempo"
    t.string   "efg"
    t.string   "turnover"
    t.string   "reb"
    t.string   "fta_rate"
    t.string   "three_point_pct"
    t.string   "two_point_pct"
    t.string   "ft_pct"
    t.string   "block_pct"
    t.string   "steal_pct"
    t.string   "three_pa_per_fga"
    t.string   "assist_rate"
    t.string   "three_point_dist"
    t.string   "two_point_dist"
    t.string   "ft_point_dist"
    t.string   "sos"
    t.string   "bench_minutes"
    t.string   "experience"
    t.string   "effective_height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "off_eff_rank"
    t.string   "def_eff_rank"
    t.string   "tempo_rank"
    t.string   "off_efg_rank"
    t.string   "def_efg_rank"
    t.string   "off_turnover_rank"
    t.string   "def_turnover_rank"
    t.string   "off_reb_rank"
    t.string   "def_reb_rank"
    t.string   "off_fta_rate_rank"
    t.string   "def_fta_rate_rank"
    t.string   "off_three_point_pct_rank"
    t.string   "def_three_point_pct_rank"
    t.string   "off_two_point_pct_rank"
    t.string   "def_two_point_pct_rank"
    t.string   "off_ft_pct_rank"
    t.string   "def_ft_pct_rank"
    t.string   "off_block_pct_rank"
    t.string   "def_block_pct_rank"
    t.string   "off_steal_pct_rank"
    t.string   "def_steal_pct_rank"
    t.string   "off_3pa_per_fga_rank"
    t.string   "def_3pa_per_fga_rank"
    t.string   "off_assist_rate_rank"
    t.string   "def_assist_rate_rank"
    t.string   "off_3_point_dist_rank"
    t.string   "def_3_point_dist_rank"
    t.string   "off_2_point_dist_rank"
    t.string   "def_2_point_dist_rank"
    t.string   "off_ft_point_dist_rank"
    t.string   "def_ft_point_dist_rank"
    t.string   "sos_rank"
    t.string   "bench_minutes_rank"
    t.string   "experience_rank"
    t.string   "effective_height_rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "games",                    default: [], array: true
    t.integer  "game_id"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
