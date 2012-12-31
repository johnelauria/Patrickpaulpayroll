class Employee < ActiveRecord::Base
  attr_accessible :classification, :designation, :dismissal_time, :name, :password, :password_confirmation, :regular_working_hours, :salary_per_day, :salary_per_hour, :starting_time, :remember_token, :username, :qualified_dependents, :marrital_status

  validates :name, :password, :password_confirmation, :salary_per_day, :starting_time, :username, :classification, :marrital_status, :qualified_dependents, presence: true

  has_many :attendances, dependent: :destroy
  has_secure_password

  before_save :save_salary_per_hour
  before_save :create_remember_token

  def semi_withholding_tax
    self.semi_withholding_tax = self.withholding_tax / 2
  end

  def withholding_tax
    if self.qualified_dependents == 0
      if monthly_salary >= 45883
        base_tax = 10416.67
        bracket_exemption = 45883
        percent_over = 0.32
      else
        if monthly_salary >= 25000 && monthly_salary <= 45882.99
          base_tax = 4166.67
          bracket_exemption = 25000
          percent_over = 0.30
        else
          if monthly_salary >= 15833 && monthly_salary <= 24999.99
            base_tax = 1875
            bracket_exemption = 15833
            percent_over = 0.25
          else
            if monthly_salary >= 10000 && monthly_salary <= 15832.99
              base_tax = 708.33
              bracket_exemption = 10000
              percent_over = 0.20
            else
              if monthly_salary >= 6667 && monthly_salary <= 9999.99
                base_tax = 208.33
                bracket_exemption = 6667
                percent_over = 0.15
              else
                if monthly_salary >= 5000 && monthly_salary <= 6666.99
                  base_tax = 41.67
                  bracket_exemption = 5000
                  percent_over = 0.10
                else
                  if monthly_salary >= 4167 && monthly_salary <= 4999.99
                    base_tax = 0
                    bracket_exemption = 4167
                    percent_over = 0.05
                  else
                    if monthly_salary <= 4166.99 && monthly_salary >= 1
                      base_tax = 0
                      bracket_exemption = 1
                      percent_over = 0
                    end
                  end
                end
              end
            end
          end
        end
      end
    
    else
    if self.qualified_dependents == 1
      if monthly_salary >= 47917
        base_tax = 10416.67
        bracket_exemption = 47917
        percent_over = 0.32
      else
        if monthly_salary >= 27083 && monthly_salary <= 47916.99
          base_tax = 4166.67
          bracket_exemption = 27083
          percent_over = 0.30
        else
          if monthly_salary >= 17917 && monthly_salary <= 27082.99
            base_tax = 1875
            bracket_exemption = 17917
            percent_over = 0.25
          else
            if monthly_salary >= 12083 && monthly_salary <= 17916.99
              base_tax = 708.33
              bracket_exemption = 12083
              percent_over = 0.20
            else
              if monthly_salary >= 8750 && monthly_salary <= 12082.99
                base_tax = 208.33
                bracket_exemption = 8750
                percent_over = 0.15
              else
                if monthly_salary >= 7083 && monthly_salary <= 8749.99
                  base_tax = 41.67
                  bracket_exemption = 7083
                  percent_over = 0.10
                else
                  if monthly_salary >= 6250 && monthly_salary <= 7082.99
                    base_tax = 0
                    bracket_exemption = 6250
                    percent_over = 0.05
                  else
                    if monthly_salary <= 6249.99 && monthly_salary >= 1
                      base_tax = 0
                      bracket_exemption = 1
                      percent_over = 0
                    end
                  end
                end
              end
            end
          end
        end
      end

    else
    if self.qualified_dependents == 2
      if monthly_salary >= 50000
        base_tax = 10416.67
        bracket_exemption = 50000
        percent_over = 0.32
      else
        if monthly_salary >= 29167 && monthly_salary <= 49999.99
          base_tax = 4166.67
          bracket_exemption = 29167
          percent_over = 0.30
        else
          if monthly_salary >= 20000 && monthly_salary <= 29166.99
            base_tax = 1875
            bracket_exemption = 20000
            percent_over = 0.25
          else
            if monthly_salary >= 14167 && monthly_salary <= 19999.99
              base_tax = 708.33
              bracket_exemption = 14167
              percent_over = 0.20
            else
              if monthly_salary >= 10833 && monthly_salary <= 14166.99
                base_tax = 208.33
                bracket_exemption = 10833
                percent_over = 0.15
              else
                if monthly_salary >= 9167 && monthly_salary <= 10832.99
                  base_tax = 41.67
                  bracket_exemption = 9166
                  percent_over = 0.10
                else
                  if monthly_salary >= 8333 && monthly_salary <= 9166.99
                    base_tax = 0
                    bracket_exemption = 8333
                    percent_over = 0.05
                  else
                    if monthly_salary <= 8332.99 && monthly_salary >= 1
                      base_tax = 0
                      bracket_exemption = 1
                      percent_over = 0
                    end
                  end
                end
              end
            end
          end
        end
      end
    else
      if self.qualified_dependents == 3
      if monthly_salary >= 52083
        base_tax = 10416.67
        bracket_exemption = 52083
        percent_over = 0.32
      else
        if monthly_salary >= 31250 && monthly_salary <= 52082.99
          base_tax = 4166.67
          bracket_exemption = 31250
          percent_over = 0.30
        else
          if monthly_salary >= 22083 && monthly_salary <= 31249.99
            base_tax = 1875
            bracket_exemption = 22083
            percent_over = 0.25
          else
            if monthly_salary >= 16250 && monthly_salary <= 22082.99
              base_tax = 708.33
              bracket_exemption = 16250
              percent_over = 0.20
            else
              if monthly_salary >= 12917 && monthly_salary <= 16249.99
                base_tax = 208.33
                bracket_exemption = 12917
                percent_over = 0.15
              else
                if monthly_salary >= 11250 && monthly_salary <= 12916.99
                  base_tax = 41.67
                  bracket_exemption = 11250
                  percent_over = 0.10
                else
                  if monthly_salary >= 10417 && monthly_salary <= 11249.99
                    base_tax = 0
                    bracket_exemption = 10417
                    percent_over = 0.05
                  else
                    if monthly_salary <= 10416.99 && monthly_salary >= 1
                      base_tax = 0
                      bracket_exemption = 1
                      percent_over = 0
                    end
                  end
                end
              end
            end
          end
        end
      end
    else
      if self.qualified_dependents == 4
      if monthly_salary >= 54167
        base_tax = 10416.67
        bracket_exemption = 54167
        percent_over = 0.32
      else
        if monthly_salary >= 33333 && monthly_salary <= 54166.99
          base_tax = 4166.67
          bracket_exemption = 33333
          percent_over = 0.30
        else
          if monthly_salary >= 24167 && monthly_salary <= 33332.99
            base_tax = 1875
            bracket_exemption = 24167
            percent_over = 0.25
          else
            if monthly_salary >= 18333 && monthly_salary <= 24166.99
              base_tax = 708.33
              bracket_exemption = 18333
              percent_over = 0.20
            else
              if monthly_salary >= 15000 && monthly_salary <= 18332.99
                base_tax = 208.33
                bracket_exemption = 15000
                percent_over = 0.15
              else
                if monthly_salary >= 13333 && monthly_salary <= 14999.99
                  base_tax = 41.67
                  bracket_exemption = 13333
                  percent_over = 0.10
                else
                  if monthly_salary >= 12500 && monthly_salary <= 13332.99
                    base_tax = 0
                    bracket_exemption = 12500
                    percent_over = 0.05
                  else
                    if monthly_salary <= 12499.99 && monthly_salary >= 1
                      base_tax = 0
                      bracket_exemption = 1
                      percent_over = 0
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    end
  end
  end
  end
    self.withholding_tax = ((self.monthly_salary - bracket_exemption) * percent_over) + base_tax
  end

  def save_salary_per_hour
    self.working_hours = ((self.dismissal_time - self.starting_time) / 1.hour)
    self.salary_per_hour = (self.salary_per_day / self.working_hours)
  end

  def cutoff_salary
    self.cutoff_salary = self.attendances.find_all_by_cutoff_id(Cutoff.last.id).map(&:total_salary_earned).sum
  end

  def monthly_salary
    self.salary_per_day * 30
  end

  def sss
    if self.classification == "Employer"
      if monthly_salary >= 14750
      self.sss = 1060
    else
      if monthly_salary <= 14749.99 && monthly_salary >= 14250
        self.sss = 1024.70
      else
        if monthly_salary <= 14249.99 && monthly_salary >= 13750
          self.sss = 989.30
        else
          if monthly_salary <= 13749.99 && monthly_salary >= 13250
            self.sss = 954.00
          else
            if monthly_salary <= 13249.99 && monthly_salary >= 12750
              self.sss = 918.70
            else
              if monthly_salary <= 12749.99 && monthly_salary >= 12250
                self.sss = 883.30
              else
                if monthly_salary <= 12249.99 && monthly_salary >= 11750
                  self.sss = 848
                else
                  if monthly_salary <= 11749.99 && monthly_salary >= 11250
                    self.sss = 812.70
                  else
                    if monthly_salary <= 11249.99 && monthly_salary >= 10750
                      self.sss = 777.30
                    else
                      if monthly_salary <= 10749.99 && monthly_salary >= 10250
                        self.sss = 742
                      else
                        if monthly_salary <= 10249.99 && monthly_salary >= 9750
                          self.sss = 706.70
                        else
                          if monthly_salary <= 9749.99 && monthly_salary >= 9250
                            self.sss = 671.30
                          else
                            if monthly_salary <= 9249.99 && monthly_salary >= 8750
                              self.sss = 636
                            else
                              if monthly_salary <= 8749.99 && monthly_salary >= 8250
                                self.sss = 600.70
                              else
                                if monthly_salary <= 8249.99 && monthly_salary >= 7750
                                  self.sss = 565.30
                                else
                                  if monthly_salary <= 7749.99 && monthly_salary >= 7250
                                    self.sss = 530.00
                                  else
                                    if monthly_salary <= 7249.99 && monthly_salary >= 6750
                                      self.sss = 494.70
                                    else
                                      if monthly_salary <= 6749.99 && monthly_salary >= 6250
                                        self.sss = 459.30
                                      else
                                        if monthly_salary <= 6249.99 && monthly_salary >= 5750
                                          self.sss = 424
                                        else
                                          if monthly_salary <= 5749.99 && monthly_salary >= 5250
                                            self.sss = 388.70
                                          else
                                            if monthly_salary <= 5249.99 && monthly_salary >= 4750
                                              self.sss = 353.30
                                            else
                                              if monthly_salary <= 4749.99 && monthly_salary >= 4250
                                                self.sss = 318
                                              else
                                                if monthly_salary <= 4249.99 && monthly_salary >= 3750
                                                  self.sss = 282.70
                                                else
                                                  if monthly_salary <= 3749.99 && monthly_salary >= 3250
                                                    self.sss = 247.30
                                                  else
                                                    if monthly_salary <= 3249.99 && monthly_salary >= 2750
                                                      self.sss = 212
                                                    else
                                                      if monthly_salary <= 2749.99 && monthly_salary >= 2250
                                                        self.sss = 176.70
                                                      else
                                                        if monthly_salary <= 2249.99 && monthly_salary >= 1750
                                                          self.sss = 141.30
                                                        else
                                                          if monthly_salary <= 1749.99 && monthly_salary >= 1250
                                                            self.sss = 106
                                                          else
                                                            if monthly_salary <= 1249.99 && monthly_salary >= 1000
                                                              self.sss = 70.70
                                                            else
                                                              self.sss = 0
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    else
      if self.classification == "Employee" || "Administrator"
    if monthly_salary >= 14750
      self.sss = 500
    else
      if monthly_salary <= 14749.99 && monthly_salary >= 14250
        self.sss = 483.30
      else
        if monthly_salary <= 14249.99 && monthly_salary >= 13750
          self.sss = 466.70
        else
          if monthly_salary <= 13749.99 && monthly_salary >= 13250
            self.sss = 450
          else
            if monthly_salary <= 13249.99 && monthly_salary >= 12750
              self.sss = 433.30
            else
              if monthly_salary <= 12749.99 && monthly_salary >= 12250
                self.sss = 416.70
              else
                if monthly_salary <= 12249.99 && monthly_salary >= 11750
                  self.sss = 400
                else
                  if monthly_salary <= 11749.99 && monthly_salary >= 11250
                    self.sss = 383.30
                  else
                    if monthly_salary <= 11249.99 && monthly_salary >= 10750
                      self.sss = 366.70
                    else
                      if monthly_salary <= 10749.99 && monthly_salary >= 10250
                        self.sss = 350
                      else
                        if monthly_salary <= 10249.99 && monthly_salary >= 9750
                          self.sss = 333.30
                        else
                          if monthly_salary <= 9749.99 && monthly_salary >= 9250
                            self.sss = 316.70
                          else
                            if monthly_salary <= 9249.99 && monthly_salary >= 8750
                              self.sss = 300
                            else
                              if monthly_salary <= 8749.99 && monthly_salary >= 8250
                                self.sss = 283.30
                              else
                                if monthly_salary <= 8249.99 && monthly_salary >= 7750
                                  self.sss = 266.70
                                else
                                  if monthly_salary <= 7749.99 && monthly_salary >= 7250
                                    self.sss = 250
                                  else
                                    if monthly_salary <= 7249.99 && monthly_salary >= 6750
                                      self.sss = 233.30
                                    else
                                      if monthly_salary <= 6749.99 && monthly_salary >= 6250
                                        self.sss = 216.70
                                      else
                                        if monthly_salary <= 6249.99 && monthly_salary >= 5750
                                          self.sss = 200
                                        else
                                          if monthly_salary <= 5749.99 && monthly_salary >= 5250
                                            self.sss = 183.30
                                          else
                                            if monthly_salary <= 5249.99 && monthly_salary >= 4750
                                              self.sss = 166.70
                                            else
                                              if monthly_salary <= 4749.99 && monthly_salary >= 4250
                                                self.sss = 150
                                              else
                                                if monthly_salary <= 4249.99 && monthly_salary >= 3750
                                                  self.sss = 133.30
                                                else
                                                  if monthly_salary <= 3749.99 && monthly_salary >= 3250
                                                    self.sss = 116.70
                                                  else
                                                    if monthly_salary <= 3249.99 && monthly_salary >= 2750
                                                      self.sss = 100
                                                    else
                                                      if monthly_salary <= 2749.99 && monthly_salary >= 2250
                                                        self.sss = 83.30
                                                      else
                                                        if monthly_salary <= 2249.99 && monthly_salary >= 1750
                                                          self.sss = 66.70
                                                        else
                                                          if monthly_salary <= 1749.99 && monthly_salary >= 1250
                                                            self.sss = 50
                                                          else
                                                            if monthly_salary <= 1249.99 && monthly_salary >= 1000
                                                              self.sss = 33.30
                                                            else
                                                              self.sss = 0
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
end

  def philhealth
    if monthly_salary >= 30000
      self.philhealth = 375
    else
      if monthly_salary <= 29999.99 && monthly_salary >= 29000
        self.philhealth = 362.50
      else
        if monthly_salary <= 28999.99 && monthly_salary >= 28000
          self.philhealth = 350
        else
          if monthly_salary <= 27999.99 && monthly_salary >= 27000
            self.philhealth = 337.50
          else
            if monthly_salary <= 26999.99 && monthly_salary >= 26000
              self.philhealth = 325
            else
              if monthly_salary <= 25999.99 && monthly_salary >= 25000
                self.philhealth = 312.50
              else
                if monthly_salary <= 24999.99 && monthly_salary >= 24000
                  self.philhealth = 300
                else
                  if monthly_salary <= 23999.99 && monthly_salary >= 23000
                    self.philhealth = 287.50
                  else
                    if monthly_salary <= 22999.99 && monthly_salary >= 22000
                      self.philhealth = 275
                    else
                      if monthly_salary <= 21999.99 && monthly_salary >= 21000
                        self.philhealth = 262.50
                      else
                        if monthly_salary <= 20999.99 && monthly_salary >= 20000
                          self.philhealth = 250
                        else
                          if monthly_salary <= 19999.99 && monthly_salary >= 19000
                            self.philhealth = 237.50
                          else
                            if monthly_salary <= 18999.99 && monthly_salary >= 18000
                              self.philhealth = 225
                            else
                              if monthly_salary <= 17999.99 && monthly_salary >= 17000
                                self.philhealth = 212.50
                              else
                                if monthly_salary <= 16999.99 && monthly_salary >= 16000
                                  self.philhealth = 200
                                else
                                  if monthly_salary <= 15999.99 && monthly_salary >= 15000
                                    self.philhealth = 187.50
                                  else
                                    if monthly_salary <= 14999.99 && monthly_salary >= 14000
                                      self.philhealth = 175
                                    else
                                      if monthly_salary <= 13999.99 && monthly_salary >= 13000
                                        self.philhealth = 162.50
                                      else
                                        if monthly_salary <= 12999.99 && monthly_salary >= 12000
                                          self.philhealth = 150
                                        else
                                          if monthly_salary <= 11999.99 && monthly_salary >= 11000
                                            self.philhealth = 137.50
                                          else
                                            if monthly_salary <= 10999.99 && monthly_salary >= 10000
                                              self.philhealth = 125
                                            else
                                              if monthly_salary <= 9999.99 && monthly_salary >= 9000
                                                self.philhealth = 112.50
                                              else
                                                if monthly_salary <= 8999.99 && monthly_salary >= 8000
                                                  self.philhealth = 100
                                                else
                                                  if monthly_salary <= 7999.99 && monthly_salary >= 7000
                                                    self.philhealth = 87.50
                                                  else
                                                    if monthly_salary <= 6999.99 && monthly_salary >= 6000
                                                      self.philhealth = 75
                                                    else
                                                      if monthly_salary <= 5999.99 && monthly_salary >= 5000
                                                        self.philhealth = 62.50
                                                      else
                                                        if monthly_salary <= 4999.99
                                                          self.philhealth = 50
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end                                              
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  def pagibig
    if self.classification == "Employee" && monthly_salary <= 1499.99
      monthly_salary * 0.01
    else
      if monthly_salary >= 1500
        monthly_salary * 0.02
      end
    end
  end

  def months_rendered
    ((self.attendances.last.created_at - (self.attendances.first.created_at)) / 1.day).to_i
  end

  def months_rendered_in_calendar_year
    months_rendered >= 12 ? 12 : months_rendered
  end

  def thirteenth_month_pay_factor
    ((self.attendances.find_all_by_attendance_year(2012).map(&:regular_pay).sum) / 12) / 12
  end

  def thirteenth_month_pay
    thirteenth_month_pay_factor * months_rendered_in_calendar_year
  end

  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end