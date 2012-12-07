class Employee < ActiveRecord::Base
  attr_accessible :classification, :designation, :dismissal_time, :name, :password, :password_confirmation, :regular_working_hours, :salary_per_day, :salary_per_hour, :starting_time, :remember_token, :username, :cutoff_salary

  validates :name, :password, :password_confirmation, :salary_per_day, :starting_time, :username, :classification, presence: true

  has_many :attendances, dependent: :destroy
  has_secure_password

  before_save :save_salary_per_hour
  before_save :create_remember_token

  def save_salary_per_hour
    self.working_hours = ((self.dismissal_time - self.starting_time) / 1.hour)
    self.salary_per_hour = (self.salary_per_day / self.working_hours)
  end

  def cutoff_salary
    self.cutoff_salary = self.attendances.map(&:total_salary_earned).sum
  end

  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
