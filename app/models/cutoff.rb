class Cutoff < ActiveRecord::Base
  include Rhoconnectrb::Resource
  attr_accessible :cutoff_date
  has_many :attendances, dependent: :destroy
  has_many :cutofftotalsalaries, dependent: :destroy

  validates :cutoff_date, uniqueness: true

  def partition
    :app
  end
end
