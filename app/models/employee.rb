class Employee < ActiveRecord::Base
  attr_accessible :classification, :designation, :dismissal_time, :name, :password, :password_confirmation, :regular_working_hours, :salary_per_day, :salary_per_hour, :starting_time, :remember_token, :username

  validates :name, :password, :password_confirmation, :salary_per_day, :starting_time, :username, presence: true

  has_many :attendances
  has_secure_password

  before_save :save_salary_per_hour
  before_save :create_remember_token

  def save_salary_per_hour
  	self.working_hours = ((self.dismissal_time - self.starting_time) / 1.hour).round
  	self.salary_per_hour = (self.salary_per_day / self.working_hours)
  end

  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end