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

ActiveRecord::Schema.define(version: 20170104154644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disciplines", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "category",    limit: 255
    t.string   "unit",        limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sgdb_id",     limit: 255
    t.integer  "export_id"
    t.string   "pdf_id",      limit: 255
  end

  create_table "newsletter_subscriptions", force: :cascade do |t|
    t.string   "email",         limit: 255
    t.string   "gender",        limit: 255
    t.integer  "year_of_birth"
    t.string   "handicap",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "performances", force: :cascade do |t|
    t.float    "value"
    t.integer  "reached_level"
    t.datetime "date"
    t.integer  "age_group"
    t.string   "handicap",            limit: 255, default: ""
    t.string   "gender",              limit: 255
    t.string   "discipline_category", limit: 255
    t.string   "city",                limit: 255
    t.boolean  "is_trial"
    t.integer  "user_id"
    t.integer  "discipline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sgdb_id",             limit: 255
    t.integer  "trial_id"
    t.string   "trainer_id",          limit: 255
  end

  create_table "requirement_groups", force: :cascade do |t|
    t.string   "gender",              limit: 255
    t.integer  "age_start"
    t.integer  "age_end"
    t.string   "handicap",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "discipline_name",     limit: 255
    t.string   "discipline_category", limit: 255
    t.text     "description"
    t.integer  "discipline_id"
    t.integer  "export_id"
    t.integer  "pdf_id"
    t.boolean  "active",                          default: true
  end

  create_table "requirements", force: :cascade do |t|
    t.float   "value"
    t.string  "unit",                 limit: 255
    t.integer "level"
    t.integer "requirement_group_id"
    t.text    "description"
  end

  create_table "sport_meetings", force: :cascade do |t|
    t.date     "starts_at"
    t.date     "ends_at"
    t.text     "free_text"
    t.text     "trial"
    t.string   "sport_name",           limit: 255
    t.string   "club_name",            limit: 255
    t.string   "custom_sport_type",    limit: 255
    t.string   "name",                 limit: 255
    t.string   "city",                 limit: 255
    t.string   "street",               limit: 255
    t.string   "postal_code",          limit: 255
    t.string   "contact_person",       limit: 255
    t.string   "contact_person_email", limit: 255
    t.string   "contact_person_fax",   limit: 255
    t.string   "weekday",              limit: 255, default: "--- []\n"
    t.string   "start_time",           limit: 255
    t.string   "end_time",             limit: 255
    t.string   "old_date_info",        limit: 255
    t.string   "url",                  limit: 255
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "on_request"
    t.boolean  "hasTrial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "modified_by"
    t.string   "sgdb_id",              limit: 255
    t.index ["club_name"], name: "index_sport_meetings_on_club_name", using: :btree
    t.index ["weekday"], name: "index_sport_meetings_on_weekday", using: :btree
  end

  create_table "sport_meetings_users", force: :cascade do |t|
    t.integer "sport_meeting_id"
    t.integer "user_id"
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "status",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "leave_date"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city",        limit: 255
  end

  create_table "trials", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "target",            limit: 255
    t.integer  "year"
    t.string   "comment",           limit: 255
    t.string   "slug",              limit: 255
    t.string   "organisation_name", limit: 255
  end

  create_table "trials_users", id: false, force: :cascade do |t|
    t.integer "trial_id"
    t.integer "user_id"
    t.index ["trial_id", "user_id"], name: "index_trials_users_on_trial_id_and_user_id", unique: true, using: :btree
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "origin_id"
    t.string   "text"
    t.datetime "published_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           limit: 255
    t.string   "crypted_password",                limit: 255
    t.string   "salt",                            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token",               limit: 255
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token",            limit: 255
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "year_of_birth"
    t.string   "handicap",                        limit: 255, default: ""
    t.integer  "endurance_level",                             default: 0
    t.integer  "agility_level",                               default: 0
    t.integer  "strength_level",                              default: 0
    t.integer  "coordination_level",                          default: 0
    t.integer  "level_sum",                                   default: 0
    t.string   "city",                            limit: 255
    t.string   "gender",                          limit: 255
    t.string   "activation_state",                limit: 255
    t.string   "activation_token",                limit: 255
    t.datetime "activation_token_expires_at"
    t.string   "first_name",                      limit: 255
    t.string   "last_name",                       limit: 255
    t.string   "sgdb_id",                         limit: 255
    t.string   "zip_code",                        limit: 255
    t.string   "street",                          limit: 255
    t.boolean  "agreed_to_terms",                             default: false
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address",      limit: 255
    t.date     "swam_at"
    t.boolean  "trial_user",                                  default: false
    t.string   "uid",                             limit: 255
    t.string   "provider",                        limit: 255
    t.boolean  "admin"
    t.boolean  "blocked"
    t.boolean  "trainer",                                     default: false
    t.string   "trainer_id",                      limit: 255
    t.string   "sport_union",                     limit: 255
    t.date     "birth_date"
    t.integer  "number_of_certificates",                      default: 0
    t.integer  "year_of_last_certificate"
    t.index ["activation_token"], name: "index_users_on_activation_token", using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  end

end
