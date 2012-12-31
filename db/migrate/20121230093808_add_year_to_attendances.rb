class AddYearToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :attendance_year, :integer
  end
end
