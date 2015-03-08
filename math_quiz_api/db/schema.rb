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

ActiveRecord::Schema.define(version: 20150307043114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "school_id"
    t.integer  "teacher_id"
  end

  create_table "problems", force: :cascade do |t|
    t.integer  "top_factor"
    t.integer  "bottom_factor"
    t.string   "operator"
    t.integer  "answer"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "problems_quizzes", force: :cascade do |t|
    t.integer "problem_id"
    t.integer "quiz_id"
  end

  add_index "problems_quizzes", ["problem_id"], name: "index_problems_quizzes_on_problem_id", using: :btree
  add_index "problems_quizzes", ["quiz_id"], name: "index_problems_quizzes_on_quiz_id", using: :btree

  create_table "quiz_sessions", force: :cascade do |t|
    t.date     "date"
    t.integer  "student_id"
    t.integer  "time_taken"
    t.integer  "correct"
    t.integer  "wrong"
    t.integer  "unanswered"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "level"
    t.string   "operator"
    t.integer  "max_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "grade"
    t.integer  "classroom_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "grade"
    t.integer  "classroom_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "problems_quizzes", "problems"
  add_foreign_key "problems_quizzes", "quizzes"
end
