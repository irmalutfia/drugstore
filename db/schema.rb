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

ActiveRecord::Schema.define(version: 20170523074938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.string   "name"
    t.integer  "stock"
    t.string   "unit"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors", force: :cascade do |t|
    t.string   "jurusan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "age_unit"
    t.text     "address"
    t.string   "phone"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "sex"
    t.datetime "born"
    t.string   "email"
    t.integer  "hobby",      default: [],              array: true
  end

  create_table "payment_details", force: :cascade do |t|
    t.datetime "date"
    t.decimal  "cash"
    t.decimal  "debt"
    t.integer  "qty"
    t.string   "unit"
    t.integer  "drug_id"
    t.integer  "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drug_id"], name: "index_payment_details_on_drug_id", using: :btree
    t.index ["payment_id"], name: "index_payment_details_on_payment_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.string   "invoice"
    t.decimal  "total"
    t.datetime "date"
    t.integer  "status"
    t.integer  "purchase_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["purchase_id"], name: "index_payments_on_purchase_id", using: :btree
  end

  create_table "prescription_details", force: :cascade do |t|
    t.integer  "qty"
    t.decimal  "price"
    t.integer  "drug_id"
    t.integer  "prescription_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["drug_id"], name: "index_prescription_details_on_drug_id", using: :btree
    t.index ["prescription_id"], name: "index_prescription_details_on_prescription_id", using: :btree
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string   "nama_dokter"
    t.string   "nama_apoteker"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.datetime "date"
    t.integer  "status"
    t.integer  "supplier_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["supplier_id"], name: "index_purchases_on_supplier_id", using: :btree
    t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "is_member"
    t.integer  "member_id"
    t.index ["member_id"], name: "index_sales_on_member_id", using: :btree
    t.index ["user_id"], name: "index_sales_on_user_id", using: :btree
  end

  create_table "sales_details", force: :cascade do |t|
    t.integer  "qty"
    t.integer  "drug_id"
    t.integer  "sale_id"
    t.integer  "prescription_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["drug_id"], name: "index_sales_details_on_drug_id", using: :btree
    t.index ["prescription_id"], name: "index_sales_details_on_prescription_id", using: :btree
    t.index ["sale_id"], name: "index_sales_details_on_sale_id", using: :btree
  end

  create_table "submajors", force: :cascade do |t|
    t.string   "konsentrasi"
    t.integer  "major_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["major_id"], name: "index_submajors_on_major_id", using: :btree
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "hp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "payment_details", "drugs"
  add_foreign_key "payment_details", "payments"
  add_foreign_key "payments", "purchases"
  add_foreign_key "prescription_details", "drugs"
  add_foreign_key "prescription_details", "prescriptions"
  add_foreign_key "purchases", "suppliers"
  add_foreign_key "purchases", "users"
  add_foreign_key "sales", "members"
  add_foreign_key "sales", "users"
  add_foreign_key "sales_details", "drugs"
  add_foreign_key "sales_details", "prescriptions"
  add_foreign_key "sales_details", "sales"
  add_foreign_key "submajors", "majors"
end
