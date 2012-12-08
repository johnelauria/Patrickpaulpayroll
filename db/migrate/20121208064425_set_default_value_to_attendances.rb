class SetDefaultValueToAttendances < ActiveRecord::Migration
  def up
  	remove_column :attendances, :total_salary_earned
  	remove_column :attendances, :total_hours_rendered
  	add_column :attendances, :total_salary_earned, :decimal, default: 0, null: false
  	add_column :attendances, :total_hours_rendered, :decimal, default: 0, null: false
  end

  def down
  	add_column :attendances, :total_salary_earned, :decimal
  	add_column :attendances, :total_hours_rendered, :decimal
  	remove_column :attendances, :total_salary_earned
  	remove_column :attendances, :total_hours_rendered
  end
end
