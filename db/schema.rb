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

ActiveRecord::Schema.define(version: 2022_02_10_170405) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "inactive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "default_values"
    t.text "yield"
    t.integer "resource_id"
    t.integer "activity_template_id"
    t.index ["activity_template_id"], name: "activity_template_id_on_activity_id"
    t.index ["resource_id"], name: "resource_id_on_activity_id"
  end

  create_table "activity_templates", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "default_values"
    t.text "yield"
    t.integer "resource_subtype_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_subtype_id"], name: "index_activity_templates_on_resource_subtype_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "description"
    t.text "detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "person_id"
    t.integer "task_id"
    t.integer "activity_id"
    t.integer "resource_id"
    t.index ["activity_id"], name: "activity_id_on_event_id"
    t.index ["person_id"], name: "person_id_on_event_id"
    t.index ["resource_id"], name: "resource_id_on_event_id"
    t.index ["task_id"], name: "task_id_on_event_id"
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

  create_table "resource_subtypes", force: :cascade do |t|
    t.string "name"
    t.integer "resource_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_type_id"], name: "index_resource_subtypes_on_resource_type_id"
  end

  create_table "resource_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "date_of_birth"
    t.date "date_on_farm"
    t.integer "resource_subtype_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resource_subtype_id"], name: "index_resources_on_resource_subtype_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "start"
    t.datetime "due"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "complete", default: false, null: false
    t.integer "person_id"
    t.integer "activity_id"
    t.index ["activity_id"], name: "index_tasks_on_activity_id"
    t.index ["person_id"], name: "index_tasks_on_person_id"
  end

  add_foreign_key "activity_templates", "resource_subtypes"
  add_foreign_key "resource_subtypes", "resource_types"
  add_foreign_key "resources", "resource_subtypes"
end
