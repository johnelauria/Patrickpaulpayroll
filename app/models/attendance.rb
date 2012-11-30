class Attendance < ActiveRecord::Base
  attr_accessible :date, :employee_id, :time_in, :time_out, :total_hours_rendered

  belongs_to :employee
end
