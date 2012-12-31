class AddRegularPayToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :regular_pay, :decimal, default: 0, null: false
  end
end
