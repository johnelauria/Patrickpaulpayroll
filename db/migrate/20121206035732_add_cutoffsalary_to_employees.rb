class AddCutoffsalaryToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :cutoff_salary, :decimal
  end
end
