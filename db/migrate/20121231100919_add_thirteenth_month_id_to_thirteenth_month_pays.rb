class AddThirteenthMonthIdToThirteenthMonthPays < ActiveRecord::Migration
  def change
    add_column :thirteenth_month_pays, :thirteenth_month_id, :integer
  end
end
