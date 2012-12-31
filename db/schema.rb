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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121231100919) do

  create_table "attendances", :force => true do |t|
    t.integer  "employee_id"
    t.time     "time_in"
    t.time     "time_out"
    t.date     "date"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "cutoff_id"
    t.decimal  "total_salary_earned",  :default => 0.0,   :null => false
    t.decimal  "total_hours_rendered", :default => 0.0,   :null => false
    t.boolean  "holiday",              :default => false
    t.integer  "attendance_year"
    t.decimal  "regular_pay",          :default => 0.0,   :null => false
  end

  create_table "cutoffs", :force => true do |t|
    t.date     "cutoff_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cutoffsalaries", :force => true do |t|
    t.string   "name"
    t.decimal  "cutoff_salary"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "cutoff_id"
  end

  create_table "cutofftotalsalaries", :force => true do |t|
    t.integer  "cutoff_id"
    t.string   "employee_name"
    t.decimal  "salary_for_cutoff", :default => 0.0, :null => false
    t.decimal  "sss",               :default => 0.0, :null => false
    t.decimal  "philhealth",        :default => 0.0, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.decimal  "pagibig",           :default => 0.0, :null => false
    t.decimal  "withholding_tax",   :default => 0.0, :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "designation"
    t.decimal  "salary_per_day"
    t.time     "starting_time"
    t.time     "dismissal_time"
    t.string   "classification"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.decimal  "working_hours"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "username"
    t.decimal  "salary_per_hour"
    t.boolean  "authorized_overtime",  :default => false
    t.decimal  "cutoff_salary",        :default => 0.0,   :null => false
    t.decimal  "total_salary_earned",  :default => 0.0,   :null => false
    t.decimal  "sss",                  :default => 0.0,   :null => false
    t.decimal  "philhealth",           :default => 0.0,   :null => false
    t.decimal  "pagibig",              :default => 0.0,   :null => false
    t.string   "marrital_status"
    t.integer  "qualified_dependents", :default => 0,     :null => false
    t.decimal  "withholding_tax",      :default => 0.0,   :null => false
    t.decimal  "semi_withholding_tax", :default => 0.0,   :null => false
    t.boolean  "authorizetoggling",    :default => false
  end

  add_index "employees", ["name"], :name => "index_employees_on_name"
  add_index "employees", ["remember_token"], :name => "index_employees_on_remember_token"
  add_index "employees", ["username"], :name => "index_employees_on_username"

  create_table "thirteenth_month_pays", :force => true do |t|
    t.integer  "year"
    t.string   "employee_name"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.decimal  "amount",              :default => 0.0, :null => false
    t.integer  "thirteenth_month_id"
  end

  create_table "thirteenth_months", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
