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

ActiveRecord::Schema.define(version: 20160401085525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.text     "notice"
    t.integer  "payment"
    t.integer  "paid"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "level"
    t.boolean  "done",       default: false
  end

  add_index "appointments", ["event_id"], name: "index_appointments_on_event_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "assets", force: :cascade do |t|
    t.string   "storage_uid"
    t.string   "storage_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "storage_width"
    t.integer  "storage_height"
    t.float    "storage_aspect_ratio"
    t.integer  "storage_depth"
    t.string   "storage_format"
    t.string   "storage_mime_type"
    t.string   "storage_size"
  end

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "appointment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "payment"
    t.integer  "paid"
  end

  add_index "children", ["appointment_id"], name: "index_children_on_appointment_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "holder_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "commentable_url"
    t.string   "commentable_title"
    t.string   "commentable_state"
    t.string   "anchor"
    t.string   "title"
    t.string   "contacts"
    t.text     "raw_content"
    t.text     "content"
    t.string   "view_token"
    t.string   "state",             default: "draft"
    t.string   "ip",                default: "undefined"
    t.string   "referer",           default: "undefined"
    t.string   "user_agent",        default: "undefined"
    t.integer  "tolerance_time"
    t.boolean  "spam",              default: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.text     "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "description"
    t.string   "address"
    t.string   "photo"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "active",                   default: true
    t.integer  "draft_comments_count",     default: 0
    t.integer  "published_comments_count", default: 0
    t.integer  "deleted_comments_count",   default: 0
  end

  create_table "static_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                       default: "", null: false
    t.string   "encrypted_password",          default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",               default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",           default: 0
    t.string   "mobile"
    t.integer  "level"
    t.string   "city"
    t.string   "community"
    t.integer  "amount"
    t.integer  "sex"
    t.datetime "birthday"
    t.integer  "my_draft_comments_count",     default: 0
    t.integer  "my_published_comments_count", default: 0
    t.integer  "my_comments_count",           default: 0
    t.integer  "draft_comcoms_count",         default: 0
    t.integer  "published_comcoms_count",     default: 0
    t.integer  "deleted_comcoms_count",       default: 0
    t.integer  "spam_comcoms_count",          default: 0
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "appointments", "events"
  add_foreign_key "appointments", "users"
  add_foreign_key "children", "appointments"
end
