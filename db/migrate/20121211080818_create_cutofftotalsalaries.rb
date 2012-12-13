class CreateCutofftotalsalaries < ActiveRecord::Migration
  def change
    create_table :cutofftotalsalaries do |t|
      t.integer :cutoff_id
      t.string :employee_name
      t.decimal :salary_for_cutoff, default: 0, null: false
      t.decimal :sss, default: 0, null: false
      t.decimal :philhealth, default: 0, null: false

      t.timestamps
    end
  end
end
