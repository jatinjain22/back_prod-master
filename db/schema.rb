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

ActiveRecord::Schema.define(version: 20160301204151) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token", limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "expires_at"
    t.boolean  "active"
    t.string   "role",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "cookstatus", force: :cascade do |t|
    t.string   "cookstatus",     limit: 255
    t.string   "available_time", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "cookstatuses", force: :cascade do |t|
    t.boolean  "status"
    t.string   "available_time", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "feedback",   limit: 65535
    t.integer  "rating",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "request_id", limit: 4
  end

  create_table "offline_users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.text     "contactno",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ops_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "ops_users", ["email"], name: "index_ops_users_on_email", unique: true, using: :btree
  add_index "ops_users", ["reset_password_token"], name: "index_ops_users_on_reset_password_token", unique: true, using: :btree

  create_table "otp_tables", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "otp",        limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "otpcontacts", force: :cascade do |t|
    t.integer  "contactno",  limit: 8
    t.integer  "otp",        limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "recurrings", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "recurring_flag", limit: 4
    t.string   "lastdate",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "service_providers", force: :cascade do |t|
    t.string   "status",      limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.text     "contactno",   limit: 65535
    t.text     "address",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "service_requests", force: :cascade do |t|
    t.text     "address",          limit: 65535
    t.string   "request_time",     limit: 255
    t.string   "status",           limit: 255
    t.string   "promised_time",    limit: 255
    t.string   "references",       limit: 255
    t.string   "service_provider", limit: 255
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "date"
    t.string   "preference",       limit: 255
    t.boolean  "party_order_flag"
    t.boolean  "groceries_flag"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_hash",   limit: 255
    t.string   "password_salt",   limit: 255
    t.integer  "contact_no",      limit: 8
    t.string   "token",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "recurring_count", limit: 4
  end

end
