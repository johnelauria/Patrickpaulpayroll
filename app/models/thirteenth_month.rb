class ThirteenthMonth < ActiveRecord::Base
  include Rhoconnectrb::Resource
  attr_accessible :year

  has_many :thirteenth_month_pays, dependent: :destroy

  def partition
    :app
  end
end
