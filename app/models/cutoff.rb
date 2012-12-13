class Cutoff < ActiveRecord::Base
  attr_accessible :cutoff_date
  has_many :attendances
  has_many :cutofftotalsalaries

  validates :cutoff_date, uniqueness: true
end
