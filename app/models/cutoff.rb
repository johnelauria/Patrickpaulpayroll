class Cutoff < ActiveRecord::Base
  attr_accessible :cutoff_date
  has_many :attendances, dependent: :destroy
  has_many :cutofftotalsalaries, dependent: :destroy

  validates :cutoff_date, uniqueness: true

end
