class AddSalaryPerHourToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :salary_per_hour, :decimal
  end
end
