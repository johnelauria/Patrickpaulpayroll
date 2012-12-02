class CreateCutoffs < ActiveRecord::Migration
  def change
    create_table :cutoffs do |t|
      t.date :cutoff_date
      t.integer :attendance_id

      t.timestamps
    end
  end
end
