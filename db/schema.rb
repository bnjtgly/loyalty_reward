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

ActiveRecord::Schema[7.1].define(version: 2024_05_20_110111) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "rewards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "reward_type"
    t.datetime "issue_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_date"], name: "index_rewards_on_issue_date"
    t.index ["user_id"], name: "index_rewards_on_user_id"
  end

  create_table "transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.decimal "amount"
    t.datetime "date"
    t.boolean "is_foreign"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_transactions_on_date"
    t.index ["is_foreign"], name: "index_transactions_on_is_foreign"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "birthday_month"
    t.integer "points"
    t.string "tier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["birthday_month"], name: "index_users_on_birthday_month"
  end

  add_foreign_key "rewards", "users"
  add_foreign_key "transactions", "users"
end
