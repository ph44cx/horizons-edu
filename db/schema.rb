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

ActiveRecord::Schema.define(version: 20170319121324) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogit_comments", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "website"
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogit_comments", ["post_id"], name: "index_blogit_comments_on_post_id"

  create_table "blogit_posts", force: :cascade do |t|
    t.string   "title",                            null: false
    t.text     "body",                             null: false
    t.string   "state",          default: "draft", null: false
    t.integer  "comments_count", default: 0,       null: false
    t.integer  "blogger_id"
    t.string   "blogger_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "blogit_posts", ["blogger_type", "blogger_id"], name: "index_blogit_posts_on_blogger_type_and_blogger_id"

  create_table "blogo_posts", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.string   "permalink",        null: false
    t.string   "title",            null: false
    t.boolean  "published",        null: false
    t.datetime "published_at",     null: false
    t.string   "markup_lang",      null: false
    t.text     "raw_content",      null: false
    t.text     "html_content",     null: false
    t.text     "html_overview"
    t.string   "tags_string"
    t.string   "meta_description", null: false
    t.string   "meta_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_posts", ["permalink"], name: "index_blogo_posts_on_permalink", unique: true
  add_index "blogo_posts", ["published_at"], name: "index_blogo_posts_on_published_at"
  add_index "blogo_posts", ["user_id"], name: "index_blogo_posts_on_user_id"

  create_table "blogo_taggings", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "blogo_taggings", ["tag_id", "post_id"], name: "index_blogo_taggings_on_tag_id_and_post_id", unique: true

  create_table "blogo_tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_tags", ["name"], name: "index_blogo_tags_on_name", unique: true

  create_table "blogo_users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogo_users", ["email"], name: "index_blogo_users_on_email", unique: true

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.string   "firstname"
    t.string   "lastname"
    t.string   "fathername"
    t.string   "nationality"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
