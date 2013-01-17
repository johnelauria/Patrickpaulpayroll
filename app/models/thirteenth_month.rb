class ThirteenthMonth < ActiveRecord::Base
  attr_accessible :year

  has_many :thirteenth_month_pays, dependent: :destroy
end
