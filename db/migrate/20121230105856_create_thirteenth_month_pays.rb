class CreateThirteenthMonthPays < ActiveRecord::Migration
  def change
    create_table :thirteenth_month_pays do |t|
      t.integer :year
      t.string :employee_name
      t.decimal :amount

      t.timestamps
    end
  end
end
