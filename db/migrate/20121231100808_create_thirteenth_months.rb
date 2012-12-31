class CreateThirteenthMonths < ActiveRecord::Migration
  def change
    create_table :thirteenth_months do |t|
      t.integer :year

      t.timestamps
    end
  end
end
