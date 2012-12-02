class RemoveAttendanceidFromCutoff < ActiveRecord::Migration
  def up
    remove_column :cutoffs, :attendance_id
    add_column :attendances, :cutoff_id, :integer
  end

  def down
    add_column :cutoffs, :attendance_id, :string
    remove_column :attendances, :cutoff_id
  end
end
