class AddSemiwithholdingtaxToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :semi_withholding_tax, :decimal, default: 0, null: false
  end
end
