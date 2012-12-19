class AddHolidayToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :holiday, :boolean, default: false
  end
end
