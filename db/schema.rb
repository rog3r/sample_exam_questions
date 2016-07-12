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

ActiveRecord::Schema.define(version: 20160707135427) do

  create_table "answers", force: :cascade do |t|
    t.integer  "attempt_id"
    t.integer  "option_id"
    t.boolean  "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answers", ["attempt_id"], name: "index_answers_on_attempt_id"
  add_index "answers", ["option_id"], name: "index_answers_on_option_id"

  create_table "attempts", force: :cascade do |t|
    t.integer  "participant_id"
    t.string   "participant_type"
    t.integer  "survey_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "attempts", ["participant_type", "participant_id"], name: "index_attempts_on_participant_type_and_participant_id"
  add_index "attempts", ["survey_id"], name: "index_attempts_on_survey_id"

  create_table "options", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "text"
    t.boolean  "correct"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "text"
    t.boolean  "multiple_choice"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "explanation"
    t.float    "weight"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id"

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "attempts_number"
    t.boolean  "finished"
    t.boolean  "active"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
