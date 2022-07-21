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

ActiveRecord::Schema.define(version: 2022_07_21_134932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "add_test5to_pttrains", force: :cascade do |t|
    t.date "test5"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.date "dob"
    t.string "breed"
    t.string "color"
    t.string "weight"
    t.string "chip"
    t.date "vaccines"
    t.date "canil"
    t.string "allergies"
    t.string "obs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "owner_id"
    t.index ["id", "id"], name: "idx_dog_id"
    t.index ["name"], name: "idx_dog_name"
    t.index ["owner_id"], name: "idx_dog_owner_id"
  end

  create_table "groupclasses", force: :cascade do |t|
    t.date "class_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dog_id"
    t.string "obs"
    t.index ["dog_id"], name: "idx_groupclass_dog_id"
    t.index ["id"], name: "idx_groupclass_id"
  end

  create_table "groupmaps", force: :cascade do |t|
    t.string "time"
    t.decimal "limit", precision: 5
  end

  create_table "grouptrains", force: :cascade do |t|
    t.date "teoric1"
    t.date "teoric2"
    t.boolean "inscr_paid"
    t.boolean "teoric_paid"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "obs"
    t.bigint "dog_id"
    t.bigint "groupmap_id"
    t.date "inscr_date"
    t.index ["dog_id"], name: "idx_grouptrain_dog_id"
    t.index ["groupmap_id"], name: "idx_grouptrain_groupmap_id"
    t.index ["id"], name: "idx_grouptrain_id"
    t.index ["status"], name: "idx_grouptrain_status"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.integer "nif"
    t.string "email"
    t.string "referral"
    t.string "obs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "idx_owner_id"
    t.index ["name"], name: "idx_owner_name"
  end

  create_table "payments", force: :cascade do |t|
    t.date "date"
    t.date "payment_date"
    t.string "obs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dog_id"
    t.index ["id"], name: "idx_payment_id"
  end

  create_table "ptclasses", force: :cascade do |t|
    t.decimal "dog_id"
    t.date "class_date"
    t.string "obs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "idx_ptclass_dog_id"
    t.index ["id"], name: "idx_ptclass_id"
  end

  create_table "ptmaps", force: :cascade do |t|
    t.string "day"
    t.decimal "limit"
  end

  create_table "pttrains", force: :cascade do |t|
    t.date "test1"
    t.date "test2"
    t.date "test3"
    t.date "test4"
    t.boolean "inscr_paid"
    t.string "status"
    t.string "obs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dog_id"
    t.bigint "ptmap_id"
    t.date "test5"
    t.date "inscr_date"
    t.text "mon1"
    t.text "mon2"
    t.text "mon3"
    t.text "mon4"
    t.text "mon5"
    t.text "mon6"
    t.index ["dog_id"], name: "idx_pttrain_dog_id"
    t.index ["id"], name: "idx_pttrain_id"
    t.index ["ptmap_id"], name: "idx_pttrain_ptmap_id"
    t.index ["status"], name: "idx_pttrain_status"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
