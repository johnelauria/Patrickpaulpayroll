class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :employee_id
      t.time :time_in
      t.time :time_out
      t.date :date
      t.time :total_hours_rendered

      t.timestamps
    end
  end
end
