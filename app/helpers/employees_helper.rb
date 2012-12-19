module EmployeesHelper
	def timed_in?
		!current_employee.attendances.nil?
	end

	def monthly_salary
    	@employee.salary_per_day * 30
  	end
end
