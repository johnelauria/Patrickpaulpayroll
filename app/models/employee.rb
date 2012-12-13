class Employee < ActiveRecord::Base
  attr_accessible :classification, :designation, :dismissal_time, :name, :password, :password_confirmation, :regular_working_hours, :salary_per_day, :salary_per_hour, :starting_time, :remember_token, :username

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

  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
