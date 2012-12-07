class Cutoff < ActiveRecord::Base
  attr_accessible :cutoff_date
  has_many :attendances

  validates :cutoff_date, uniqueness: true
end
