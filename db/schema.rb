ActiveRecord::Schema[7.0].define(version: 2023_08_01_200321) do
  enable_extension "plpgsql"

  create_table "todos", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "description"
    t.date "deadline"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
