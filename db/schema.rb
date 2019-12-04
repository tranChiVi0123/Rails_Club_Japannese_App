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

ActiveRecord::Schema.define(version: 2019_04_16_130041) do

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.text "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_categories_on_title", unique: true
  end

  create_table "class_members", force: :cascade do |t|
    t.integer "user_id"
    t.integer "classs_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classs_id"], name: "index_class_members_on_classs_id"
    t.index ["user_id"], name: "index_class_members_on_user_id"
  end

  create_table "classses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_classses_on_name"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "commons", force: :cascade do |t|
    t.string "title"
    t.text "url"
    t.text "img_logo"
    t.text "img_cover"
    t.text "img_nav_icon"
    t.string "email"
    t.text "address"
    t.text "facebook"
    t.text "youtube"
    t.text "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "title"
    t.text "list_questions"
    t.integer "category_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_exams_on_category_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
    t.index [nil], name: "index_exams_on_test_session"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.string "tags"
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "level", null: false
    t.text "content", null: false
    t.text "answers", null: false
    t.string "key", null: false
    t.integer "category_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
    t.index ["level"], name: "index_questions_on_level"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.text "comment"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "session_members", force: :cascade do |t|
    t.integer "test_session_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_session_id"], name: "index_session_members_on_test_session_id"
    t.index ["user_id"], name: "index_session_members_on_user_id"
  end

  create_table "test_exams", force: :cascade do |t|
    t.integer "test_session_id"
    t.integer "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_test_exams_on_exam_id"
    t.index ["test_session_id"], name: "index_test_exams_on_test_session_id"
    t.index [nil], name: "index_test_exams_on_exam"
    t.index [nil], name: "index_test_exams_on_test_session"
  end

  create_table "test_papers", force: :cascade do |t|
    t.text "content"
    t.integer "point"
    t.integer "exam_id"
    t.integer "category_id"
    t.integer "user_id"
    t.integer "test_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_test_papers_on_category_id"
    t.index ["exam_id"], name: "index_test_papers_on_exam_id"
    t.index ["test_session_id"], name: "index_test_papers_on_test_session_id"
    t.index ["user_id"], name: "index_test_papers_on_user_id"
    t.index [nil], name: "index_test_papers_on_exam"
    t.index [nil], name: "index_test_papers_on_test_session"
    t.index [nil], name: "index_test_papers_on_user"
  end

  create_table "test_sessions", force: :cascade do |t|
    t.text "content"
    t.text "list_exams"
    t.string "img", default: "projects/project.jpg"
    t.datetime "time_public"
    t.integer "time_remaining"
    t.integer "category_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_test_sessions_on_category_id"
    t.index ["user_id"], name: "index_test_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.integer "role", default: 1, null: false
    t.string "name", limit: 128
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
