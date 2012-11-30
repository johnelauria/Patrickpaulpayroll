class AddIndicesToEmployee < ActiveRecord::Migration
  def change
    add_index :employees, :username
    add_index :employees, :remember_token
  end
end
