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

ActiveRecord::Schema.define(version: 20171005132433) do

  create_table "inventories", force: :cascade do |t|
    t.string   "year",       limit: 255
    t.string   "campus",     limit: 255
    t.string   "file",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "inventory_users", force: :cascade do |t|
    t.integer  "inventory_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "inventory_users", ["inventory_id"], name: "index_inventory_users_on_inventory_id", using: :btree
  add_index "inventory_users", ["user_id"], name: "index_inventory_users_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "inventory_id",       limit: 4
    t.boolean  "verified"
    t.string   "estado_conservacao", limit: 255
    t.string   "situacao_uso",       limit: 255
    t.string   "sala_atual",         limit: 255
    t.string   "responsavel_atual",  limit: 255
    t.string   "ord",                limit: 255
    t.string   "cbarra",             limit: 255
    t.string   "tombo",              limit: 255
    t.string   "ed",                 limit: 255
    t.text     "descricao",          limit: 65535
    t.string   "responsavel",        limit: 255
    t.string   "sala",               limit: 255
    t.string   "valor",              limit: 255
    t.string   "campus",             limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "items", ["inventory_id"], name: "index_items_on_inventory_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.string   "name",                   limit: 255
    t.boolean  "admin"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "inventory_users", "inventories"
  add_foreign_key "inventory_users", "users"
  add_foreign_key "items", "inventories"
  add_foreign_key "items", "users"
end
