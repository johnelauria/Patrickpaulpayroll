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

ActiveRecord::Schema.define(:version => 20121130101356) do

  create_table "attendances", :force => true do |t|
    t.integer  "employee_id"
    t.time     "time_in"
    t.time     "time_out"
    t.date     "date"
    t.time     "total_hours_rendered"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "designation"
    t.decimal  "salary_per_day"
    t.string   "salary_per_hour"
    t.time     "starting_time"
    t.time     "dismissal_time"
    t.string   "classification"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.decimal  "working_hours"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "username"
  end

  add_index "employees", ["name"], :name => "index_employees_on_name"
  add_index "employees", ["remember_token"], :name => "index_employees_on_remember_token"
  add_index "employees", ["username"], :name => "index_employees_on_username"

end
