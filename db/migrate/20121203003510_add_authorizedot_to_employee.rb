class AddAuthorizedotToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :authorized_overtime, :boolean, default: false
  end
end
