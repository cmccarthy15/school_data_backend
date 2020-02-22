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

ActiveRecord::Schema.define(version: 2020_02_21_220323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bdns", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dem_stats", force: :cascade do |t|
    t.integer "start_year"
    t.integer "male"
    t.float "male_percentage"
    t.integer "female"
    t.float "female_percentage"
    t.integer "white"
    t.float "white_percentage"
    t.integer "asian"
    t.float "asian_percentage"
    t.integer "black"
    t.float "black_percentage"
    t.integer "hispanic"
    t.float "hispanic_percentage"
    t.integer "multiracial"
    t.float "multiracial_percentage"
    t.integer "ell"
    t.float "ell_percentage"
    t.integer "poverty"
    t.float "poverty_percentage"
    t.integer "disability"
    t.float "disability_percentage"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_dem_stats_on_school_id"
  end

  create_table "gen_stats", force: :cascade do |t|
    t.integer "start_year", null: false
    t.integer "total_enrollment", null: false
    t.float "economic_need"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_gen_stats_on_school_id"
  end

  create_table "grade_stats", force: :cascade do |t|
    t.integer "start_year"
    t.integer "grade_pk"
    t.integer "grade_k"
    t.integer "grade_1"
    t.integer "grade_2"
    t.integer "grade_3"
    t.integer "grade_4"
    t.integer "grade_5"
    t.integer "grade_6"
    t.integer "grade_7"
    t.integer "grade_8"
    t.integer "grade_9"
    t.integer "grade_10"
    t.integer "grade_11"
    t.integer "grade_12"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_grade_stats_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.bigint "bdn_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bdn_id"], name: "index_schools_on_bdn_id"
  end

  add_foreign_key "dem_stats", "schools"
  add_foreign_key "gen_stats", "schools"
  add_foreign_key "grade_stats", "schools"
  add_foreign_key "schools", "bdns"
end
