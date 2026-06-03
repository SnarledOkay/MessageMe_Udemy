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

ActiveRecord::Schema[8.1].define(version: 2026_06_02_093510) do
  create_table "chatrooms", force: :cascade do |t|
    t.integer "admin_id"
    t.string "chatroom_type", default: "chat"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "theme", default: "lightgrey"
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_chatrooms_on_admin_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "receiver_id", null: false
    t.integer "sender_id", null: false
    t.string "status", default: "pending", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_friendships_on_receiver_id"
    t.index ["sender_id"], name: "index_friendships_on_sender_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "chatroom_id"
    t.datetime "created_at", null: false
    t.datetime "last_read_at"
    t.string "role", default: "member"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["chatroom_id"], name: "index_memberships_on_chatroom_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "chatroom_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.boolean "deleted", default: false
    t.string "message_type", default: "user"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.text "introduction"
    t.string "password_digest"
    t.string "telephone"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "chatrooms", "users", column: "admin_id"
  add_foreign_key "friendships", "users", column: "receiver_id"
  add_foreign_key "friendships", "users", column: "sender_id"
  add_foreign_key "memberships", "chatrooms"
  add_foreign_key "memberships", "users"
  add_foreign_key "messages", "chatrooms"
end
