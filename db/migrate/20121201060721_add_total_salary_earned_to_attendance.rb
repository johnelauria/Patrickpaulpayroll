class AddTotalSalaryEarnedToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :total_salary_earned, :decimal
  end
end
