class RemoveSalaryPerHourFromEmployees < ActiveRecord::Migration
  def up
    remove_column :employees, :salary_per_hour
  end

  def down
    add_column :employees, :salary_per_hour, :string
  end
end
