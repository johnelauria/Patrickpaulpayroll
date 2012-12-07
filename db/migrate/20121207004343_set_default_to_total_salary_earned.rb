class SetDefaultToTotalSalaryEarned < ActiveRecord::Migration
  def up
  	remove_column :employees, :total_salary_earned
  	add_column :employees, :total_salary_earned, :decimal, default: 0, null: false
  end

  def down
  	add_column :employees, :total_salary_earned, :decimal
  	remove_column :employees, :total_salary_earned
  end
end
