class AddDefaultValueToAmount < ActiveRecord::Migration
  def up
    remove_column :thirteenth_month_pays, :amount
    add_column :thirteenth_month_pays, :amount, :decimal, default: 0, null: false
  end

  def down
    add_column :thirteenth_month_pays, :amount, :decimal
    remove_column :thirteenth_month_pays, :amount
  end
end
