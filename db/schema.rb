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

ActiveRecord::Schema.define(version: 20140515235008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coverage_reports", force: true do |t|
    t.string   "company_name"
    t.string   "announcement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coverage_reports_users", force: true do |t|
    t.integer "coverage_report_id"
    t.integer "user_id"
  end

  create_table "hits", force: true do |t|
    t.string   "hit_url"
    t.string   "hit_publication"
    t.string   "hit_title"
    t.string   "hit_author"
    t.string   "hit_date"
    t.string   "hit_sentiment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coverage_report_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
