class Attendance < ActiveRecord::Base
  attr_accessible :cutoff_id, :date, :employee_id, :time_in, :time_out, :total_hours_rendered, :total_salary_earned

  belongs_to :cutoff, dependent: :destroy
  belongs_to :employee, dependent: :destroy
  before_update :total_hours

  
 	def total_hours
    	self.total_hours_rendered = ((self.time_out - self.time_in) / 1.hour)
    	self.total_salary_earned = (self.total_hours_rendered * self.employee.salary_per_hour)
	end
end
