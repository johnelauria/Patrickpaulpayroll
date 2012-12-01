class ChangeTotalhoursrenderedToDecimal < ActiveRecord::Migration
  def up
  	remove_column :attendances, :total_hours_rendered
  	add_column :attendances, :total_hours_rendered, :decimal
  end

  def down
  	add_column :attendances, :total_hours_rendered, :time
  	remove_column :attendances, :total_hours_rendered
  end
end
