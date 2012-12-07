class SetNullToFalseInCutoffSalary < ActiveRecord::Migration
  def up
  	remove_column :employees, :cutoff_salary
  	add_column :employees, :cutoff_salary, :decimal, null: false, default: 0
  end

  def down
  	add_column :employees, :cutoff_salary, :decimal
  	remove_column :employees, :cutoff_salary
  end
end
