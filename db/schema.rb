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

ActiveRecord::Schema.define(version: 20160229054746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_iterations", force: :cascade do |t|
    t.date    "start"
    t.date    "end"
    t.integer "course_id"
    t.integer "created_by_id"
  end

  add_index "course_iterations", ["course_id"], name: "index_course_iterations_on_course_id", using: :btree
  add_index "course_iterations", ["created_by_id"], name: "index_course_iterations_on_created_by_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "created_by_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "courses", ["created_by_id"], name: "index_courses_on_created_by_id", using: :btree

  create_table "curriculum_deliveries", force: :cascade do |t|
    t.integer "curriculum_id"
    t.integer "taught_by_id"
  end

  add_index "curriculum_deliveries", ["curriculum_id"], name: "index_curriculum_deliveries_on_curriculum_id", using: :btree
  add_index "curriculum_deliveries", ["taught_by_id"], name: "index_curriculum_deliveries_on_taught_by_id", using: :btree

  create_table "curriculum_types", force: :cascade do |t|
    t.string  "name"
    t.boolean "is_teachable", default: false
    t.boolean "is_workable",  default: false
  end

  create_table "curriculums", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "curriculum_type_id"
    t.integer  "parent_id"
    t.integer  "created_by_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "curriculums", ["created_by_id"], name: "index_curriculums_on_created_by_id", using: :btree
  add_index "curriculums", ["curriculum_type_id"], name: "index_curriculums_on_curriculum_type_id", using: :btree
  add_index "curriculums", ["parent_id"], name: "index_curriculums_on_parent_id", using: :btree

  create_table "delivery_days", force: :cascade do |t|
    t.integer  "iteration_day_id"
    t.integer  "curriculum_delivery_id"
    t.text     "notes"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "delivery_days", ["curriculum_delivery_id"], name: "index_delivery_days_on_curriculum_delivery_id", using: :btree
  add_index "delivery_days", ["iteration_day_id"], name: "index_delivery_days_on_iteration_day_id", using: :btree

  create_table "delivery_to_students", force: :cascade do |t|
    t.integer "iteration_student_id"
    t.integer "delivery_day_id"
  end

  add_index "delivery_to_students", ["delivery_day_id"], name: "index_delivery_to_students_on_delivery_day_id", using: :btree
  add_index "delivery_to_students", ["iteration_student_id"], name: "index_delivery_to_students_on_iteration_student_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iteration_days", force: :cascade do |t|
    t.date    "day"
    t.integer "course_iteration_id"
  end

  add_index "iteration_days", ["course_iteration_id"], name: "index_iteration_days_on_course_iteration_id", using: :btree

  create_table "iteration_students", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_iteration_id"
    t.integer  "created_by_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "iteration_students", ["course_iteration_id"], name: "index_iteration_students_on_course_iteration_id", using: :btree
  add_index "iteration_students", ["created_by_id"], name: "index_iteration_students_on_created_by_id", using: :btree
  add_index "iteration_students", ["student_id"], name: "index_iteration_students_on_student_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_works", force: :cascade do |t|
    t.integer  "delivery_to_student_id"
    t.integer  "work_type_id"
    t.text     "info"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "student_works", ["delivery_to_student_id"], name: "index_student_works_on_delivery_to_student_id", using: :btree
  add_index "student_works", ["work_type_id"], name: "index_student_works_on_work_type_id", using: :btree

  create_table "user_images", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_images", ["image_id"], name: "index_user_images_on_image_id", using: :btree
  add_index "user_images", ["user_id"], name: "index_user_images_on_user_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "sms"
    t.string   "password_digest"
    t.boolean  "is_temp_password", default: true
    t.integer  "avatar_ui_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["avatar_ui_id"], name: "index_users_on_avatar_ui_id", using: :btree

  create_table "work_types", force: :cascade do |t|
    t.string  "name"
    t.text    "notes"
    t.boolean "is_url", default: false
  end

  add_foreign_key "course_iterations", "courses"
  add_foreign_key "curriculum_deliveries", "curriculums"
  add_foreign_key "curriculums", "curriculum_types"
  add_foreign_key "delivery_days", "curriculum_deliveries"
  add_foreign_key "delivery_days", "iteration_days"
  add_foreign_key "delivery_to_students", "delivery_days"
  add_foreign_key "iteration_days", "course_iterations"
  add_foreign_key "iteration_students", "course_iterations"
  add_foreign_key "student_works", "delivery_to_students"
  add_foreign_key "student_works", "work_types"
  add_foreign_key "user_images", "images"
  add_foreign_key "user_images", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
