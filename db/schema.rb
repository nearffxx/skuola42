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

ActiveRecord::Schema.define(version: 20140616140035) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.integer  "professor_id"
    t.text     "modality"
    t.text     "description"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "books"
    t.string   "extra_materials"
    t.integer  "school_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_subjects", force: true do |t|
    t.integer "course_id"
    t.integer "subject_id"
  end

  create_table "event_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.integer  "event_type_id"
    t.integer  "structure_id"
    t.text     "description"
    t.text     "participations"
    t.datetime "datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_subjects", force: true do |t|
    t.integer "event_id"
    t.integer "subject_id"
  end

  create_table "meetings", force: true do |t|
    t.datetime "datetime"
    t.string   "location"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings_professors", force: true do |t|
    t.integer "meeting_id"
    t.integer "professor_id"
  end

  create_table "plans", force: true do |t|
    t.integer  "subject_id"
    t.integer  "school_year_id"
    t.text     "program"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "telephone"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors_subjects", force: true do |t|
    t.integer "professor_id"
    t.integer "subject_id"
  end

  create_table "schedules", force: true do |t|
    t.integer  "course_id"
    t.integer  "school_day_id"
    t.text     "lessons"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_days", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_years", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "structures", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "program"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
