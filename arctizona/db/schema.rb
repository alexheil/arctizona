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

ActiveRecord::Schema.define(version: 20171219191434) do

  create_table "albums", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gallery_id"
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gallery_id"], name: "index_albums_on_gallery_id"
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_galleries_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "city",       default: ""
    t.string   "state",      default: ""
    t.string   "country",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gallery_id"
    t.integer  "album_id"
    t.string   "title",         default: ""
    t.string   "photo"
    t.text     "description",   default: ""
    t.boolean  "cover_photo",   default: false
    t.boolean  "profile_photo", default: false
    t.string   "slug"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["album_id"], name: "index_photos_on_album_id"
    t.index ["gallery_id"], name: "index_photos_on_gallery_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name",       default: ""
    t.string   "last_name",        default: ""
    t.integer  "age"
    t.string   "website",          default: ""
    t.string   "facebook_handle",  default: ""
    t.string   "facebook_url",     default: ""
    t.string   "twitter_handle",   default: ""
    t.string   "twitter_url",      default: ""
    t.string   "instagram_handle", default: ""
    t.string   "instagram_url",    default: ""
    t.text     "biography",        default: ""
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "main_color",       default: ""
    t.string   "text_color",       default: ""
    t.string   "background_color", default: ""
    t.string   "link_color",       default: ""
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_themes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "slug",                   default: "", null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
