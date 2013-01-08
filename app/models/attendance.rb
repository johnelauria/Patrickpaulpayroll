class Attendance < ActiveRecord::Base
  include Rhoconnectrb::Resource
  attr_accessible :cutoff_id, :date, :employee_id, :time_in, :time_out, :total_hours_rendered, :total_salary_earned, :holiday

  belongs_to :cutoff
  belongs_to :employee
  before_update :total_hours
  before_update :create_regular_pay
  before_create :create_attendance_year
  before_create :holiday_attendance

  def partition
    :app
  end

	def total_hours
		self.total_hours_rendered = ((self.time_out - self.time_in) / 1.hour)
		if self.holiday?
			self.total_salary_earned = ((self.total_hours_rendered * self.employee.salary_per_hour) * 2)
		else
			self.total_salary_earned = (self.total_hours_rendered * self.employee.salary_per_hour)
		end
  end

  def holiday_attendance
    if Attendance.last.holiday?
      self.holiday = true
    end
  end

	def ensure_attendance_not_nil
		if Attendance.first.nil?
			Attendance.create(id: 1, employee_id: Employee.first.id, date: Date.today, holiday: false)
		end
  end

  def create_attendance_year
    self.attendance_year = Date.today.strftime("%Y").to_i
  end

  def create_regular_pay
    self.holiday? ? self.regular_pay = total_salary_earned / 2 : self.regular_pay = total_salary_earned
  end
end
