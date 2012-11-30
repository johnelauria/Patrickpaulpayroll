class ChangeRegularworkinghoursToDecimal < ActiveRecord::Migration
  def up
  	remove_column :employees, :regular_working_hours
  	add_column :employees, :working_hours, :decimal
  end

  def down
  	add_column :employees, :regular_working_hours
  	remove_column :employees, :working_hours, :decimal
  end
end
