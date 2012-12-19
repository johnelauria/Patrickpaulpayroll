class AddDetailsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :marrital_status, :string
    add_column :employees, :qualified_dependents, :integer, default: 0, null: false
    add_column :employees, :withholding_tax, :decimal, default: 0, null: false
  end
end
