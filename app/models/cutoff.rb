class Cutoff < ActiveRecord::Base
  attr_accessible :cutoff_date
  has_many :attendances, dependent: :destroy
end
