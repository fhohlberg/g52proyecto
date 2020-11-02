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

ActiveRecord::Schema.define(version: 2020_11_02_174007) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "address"
    t.string "favs", default: [], array: true
    t.string "lastname"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["invitation_token"], name: "index_clients_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_clients_on_invitations_count"
    t.index ["invited_by_id"], name: "index_clients_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_clients_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "order_plates", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "plate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plates_quantity"
    t.index ["order_id"], name: "index_order_plates_on_order_id"
    t.index ["plate_id"], name: "index_order_plates_on_plate_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "price"
    t.string "payment"
    t.text "address"
    t.time "delivery_time"
    t.string "status"
    t.text "notes"
    t.integer "restaurante_id"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "platos", default: [], array: true
    t.integer "portions"
    t.json "hash_platos", default: "{}", null: false
  end

  create_table "plate_comments", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plate_id"
    t.integer "client_id"
    t.string "client_name"
    t.string "clients_like", default: [], array: true
  end

  create_table "plates", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "description"
    t.integer "portions"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "restaurante_id"
    t.string "clients_ratings", default: [], array: true
    t.integer "valoration"
    t.string "ratings", default: [], array: true
    t.string "rate"
    t.integer "quantity"
  end

  create_table "restaurant_comments", force: :cascade do |t|
    t.text "body"
    t.string "client_name"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "restaurante_id"
    t.string "clients_like", default: [], array: true
  end

  create_table "restaurantes", force: :cascade do |t|
    t.string "name"
    t.string "mail"
    t.string "adress"
    t.string "valoration"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.boolean "approved", default: false, null: false
    t.string "ratings", default: [], array: true
    t.string "rate"
    t.integer "valoration1"
    t.string "clients_ratings", default: [], array: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
