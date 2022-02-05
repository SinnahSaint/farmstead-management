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

ActiveRecord::Schema.define(version: 2022_02_05_205753) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "inactive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "activities_tasks", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "activity_id", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "description"
    t.text "detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events_people", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "person_id", null: false
  end

  create_table "events_tasks", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "event_id", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.boolean "inactive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people_tasks", id: false, force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "task_id", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "start"
    t.datetime "due"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "complete", default: false, null: false
    t.integer "person_id"
  end

end
