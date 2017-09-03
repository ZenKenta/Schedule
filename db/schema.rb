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

ActiveRecord::Schema.define(version: 20170813151614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name",                   null: false
    t.date     "start_date"
    t.date     "end_date"
    t.string   "place"
    t.string   "detail"
    t.string   "kind"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["name"], name: "index_events_on_name", using: :btree
    t.index ["start_date"], name: "index_events_on_start_date", using: :btree
    t.index ["status"], name: "index_events_on_status", using: :btree
  end

  create_table "kako_events", force: :cascade do |t|
    t.string   "nengetsu"
    t.string   "name",       null: false
    t.date     "start_date"
    t.date     "end_date"
    t.string   "place"
    t.string   "detail"
    t.string   "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nengetsu"], name: "index_kako_events_on_nengetsu", using: :btree
    t.index ["start_date"], name: "index_kako_events_on_start_date", using: :btree
  end

  create_table "kako_personal_schedules", force: :cascade do |t|
    t.string   "nengetsu",   null: false
    t.integer  "eventid",    null: false
    t.string   "shimei",     null: false
    t.date     "nengetsuhi", null: false
    t.string   "valuse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nengetsu"], name: "index_kako_personal_schedules_on_nengetsu", using: :btree
    t.index ["shimei"], name: "index_kako_personal_schedules_on_shimei", using: :btree
  end

  create_table "moshikomis", force: :cascade do |t|
    t.integer  "eventid"
    t.string   "shimei",                 null: false
    t.string   "email",                  null: false
    t.string   "lineId"
    t.integer  "male",       default: 0
    t.integer  "female",     default: 0
    t.string   "biko"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "nittei_cyoseis", force: :cascade do |t|
    t.integer  "eventid"
    t.date     "nengetsuhi", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_schedules", force: :cascade do |t|
    t.integer  "eventid",    null: false
    t.string   "shimei",     null: false
    t.date     "nengetsuhi", null: false
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eventid", "shimei"], name: "index_personal_schedules_on_eventid_and_shimei", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "account",    null: false
    t.string   "password",   null: false
    t.string   "kind"
    t.string   "false"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
