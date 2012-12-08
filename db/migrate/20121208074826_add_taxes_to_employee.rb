class AddTaxesToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :sss, :decimal, default: 0, null: false
    add_column :employees, :philhealth, :decimal, default: 0, null: false
    add_column :employees, :pagibig, :decimal, default: 0, null: false
  end
end
