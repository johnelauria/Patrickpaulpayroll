class AddAuthorizetogglingToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :authorizetoggling, :boolean, default: false
  end
end
