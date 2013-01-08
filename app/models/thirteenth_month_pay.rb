class ThirteenthMonthPay < ActiveRecord::Base
  include Rhoconnectrb::Resource
  attr_accessible :amount, :employee_name, :year, :thirteenth_month_id

  belongs_to :thirteenth_month

  before_update :create_thirteenth_month_id

  def create_thirteenth_month_id
    self.thirteenth_month_id = ThirteenthMonth.last.id
  end

  def partition
    :app
  end
end
