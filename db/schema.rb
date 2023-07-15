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

ActiveRecord::Schema[7.0].define(version: 2023_07_15_120132) do
  create_table "analyses", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.text "long_description"
    t.string "image"
    t.string "photo_credit"
    t.boolean "is_hot_news", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "analyses_players", id: false, force: :cascade do |t|
    t.integer "analysis_id", null: false
    t.integer "player_id", null: false
    t.index ["analysis_id"], name: "index_analyses_players_on_analysis_id"
    t.index ["player_id"], name: "index_analyses_players_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "rotowire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
