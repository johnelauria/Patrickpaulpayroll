class Cutofftotalsalary < ActiveRecord::Base
  attr_accessible :cutoff_id, :employee_name, :philhealth, :salary_for_cutoff, :sss, :pagibig, :withholding_tax
  belongs_to :cutoff
end
