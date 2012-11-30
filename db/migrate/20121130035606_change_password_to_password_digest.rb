class ChangePasswordToPasswordDigest < ActiveRecord::Migration
  def up
  	remove_column :employees, :password
  	add_column :employees, :password_digest, :string
  	add_column :employees, :remember_token, :string
  end

  def down
  	add_column :employees, :password, :string
  	remove_column :employees, :password_digest, :string
  	remove_column :employees, :remember_token, :string
  end
end
