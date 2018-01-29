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

ActiveRecord::Schema.define(version: 20161212005828) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "status_id"
    t.string   "avatar"
    t.string   "banner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities_users", force: :cascade do |t|
    t.integer "community_id"
    t.integer "user_id"
    t.index ["community_id", "user_id"], name: "index_communities_users_on_community_id_and_user_id", unique: true
  end

  create_table "conversationalists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_conversationalists_on_conversation_id"
    t.index ["user_id"], name: "index_conversationalists_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
  end

  create_table "friendships", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.integer "status"
  end

  create_table "messages", force: :cascade do |t|
    t.string  "content"
    t.integer "user_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "multiposts", force: :cascade do |t|
    t.integer "community_id"
    t.integer "post_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "pic"
    t.integer  "external_id"
    t.string   "external_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "avatar"
    t.string   "title"
    t.float    "price"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "city"
    t.string   "province"
    t.date     "dob"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
