class Attendance < ActiveRecord::Base
  attr_accessible :cutoff_id, :date, :employee_id, :time_in, :time_out, :total_hours_rendered, :total_salary_earned, :holiday

  belongs_to :cutoff
  belongs_to :employee
  before_update :total_hours

	def total_hours
		self.total_hours_rendered = ((self.time_out - self.time_in) / 1.hour)
		if self.holiday?
			self.total_salary_earned = ((self.total_hours_rendered * self.employee.salary_per_hour) * 2)
		else
			self.total_salary_earned = (self.total_hours_rendered * self.employee.salary_per_hour)
		end
	end

	def ensure_attendance_not_nil
		if Attendance.nil?
			Attendance.create(id: 1, employee_id: Employee.first.id, date: Date.today, holiday: false)
		end
	end
end
