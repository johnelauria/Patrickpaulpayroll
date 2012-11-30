class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :designation
      t.string :password
      t.decimal :salary_per_day
      t.string :salary_per_hour
      t.time :starting_time
      t.time :dismissal_time
      t.string :regular_working_hours
      t.string :classification

      t.timestamps
    end
    add_index :employees, :name
  end
end
