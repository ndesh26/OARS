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

ActiveRecord::Schema.define(version: 20161101192908) do

  create_table "course_completeds", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "credit"
    t.string   "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_course_completeds_on_user_id"
  end

  create_table "course_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_requests_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "dept"
    t.string   "code"
    t.string   "title"
    t.string   "instructor"
    t.integer  "credit"
    t.string   "timing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "roll"
    t.string   "phone"
    t.text     "address"
    t.string   "dob"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
