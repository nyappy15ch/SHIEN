# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_22_093417) do

  create_table "contact_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "status"
    t.text "comment", null: false
    t.bigint "user_id"
    t.bigint "team_id"
    t.bigint "matter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["matter_id"], name: "index_contact_logs_on_matter_id"
    t.index ["team_id"], name: "index_contact_logs_on_team_id"
    t.index ["user_id"], name: "index_contact_logs_on_user_id"
  end

  create_table "matters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "sales_person", null: false
    t.string "kana_sales_person", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.string "cell_phone_number", null: false
    t.string "postal_code", null: false
    t.string "municipality", null: false
    t.string "address", null: false
    t.string "building"
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_matters_on_team_id"
    t.index ["user_id"], name: "index_matters_on_user_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "team_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "contact_logs", "matters"
  add_foreign_key "contact_logs", "teams"
  add_foreign_key "contact_logs", "users"
  add_foreign_key "matters", "teams"
  add_foreign_key "matters", "users"
  add_foreign_key "users", "teams"
end
