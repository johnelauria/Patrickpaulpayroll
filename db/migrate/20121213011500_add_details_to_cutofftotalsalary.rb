class AddDetailsToCutofftotalsalary < ActiveRecord::Migration
  def change
    add_column :cutofftotalsalaries, :pagibig, :decimal, default: 0, null: false
    add_column :cutofftotalsalaries, :withholding_tax, :decimal, default: 0, null: false
  end
end
