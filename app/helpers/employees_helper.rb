module EmployeesHelper
	def timed_in?
		!current_employee.attendances.nil?
	end
end
