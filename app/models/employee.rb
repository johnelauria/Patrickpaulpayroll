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
    self.cutoff_salary = self.attendances.map(&:total_salary_earned).sum
  end

  def monthly_salary
    self.salary_per_day * 30
  end

  def sss
    if monthly_salary >= 14750
      self.sss = 1560
    else
      if monthly_salary <= 14749.99 && monthly_salary >= 14250
        self.sss = 1508
      else
        if monthly_salary <= 14249.99 && monthly_salary >= 13750
          self.sss = 1456
        else
          if monthly_salary <= 13749.99 && monthly_salary >= 13250
            self.sss = 1404
          else
            if monthly_salary <= 13249.99 && monthly_salary >= 12750
              self.sss = 1352
            else
              if monthly_salary <= 12749.99 && monthly_salary >= 12250
                self.sss = 1300
              else
                if monthly_salary <= 12249.99 && monthly_salary >= 11750
                  self.sss = 1248
                else
                  if monthly_salary <= 11749.99 && monthly_salary >= 11250
                    self.sss = 1196
                  else
                    if monthly_salary <= 11249.99 && monthly_salary >= 10750
                      self.sss = 1144
                    else
                      if monthly_salary <= 10749.99 && monthly_salary >= 10250
                        self.sss = 1092
                      else
                        if monthly_salary <= 10249.99 && monthly_salary >= 9750
                          self.sss = 1040
                        else
                          if monthly_salary <= 9749.99 && monthly_salary >= 9250
                            self.sss = 988
                          else
                            if monthly_salary <= 9249.99 && monthly_salary >= 8750
                              self.sss = 936
                            else
                              if monthly_salary <= 8749.99 && monthly_salary >= 8250
                                self.sss = 884
                              else
                                if monthly_salary <= 8249.99 && monthly_salary >= 7750
                                  self.sss = 832
                                else
                                  if monthly_salary <= 7749.99 && monthly_salary >= 7250
                                    self.sss = 780
                                  else
                                    if monthly_salary <= 7249.99 && monthly_salary >= 6750
                                      self.sss = 728
                                    else
                                      if monthly_salary <= 6749.99 && monthly_salary >= 6250
                                        self.sss = 676
                                      else
                                        if monthly_salary <= 6249.99 && monthly_salary >= 5750
                                          self.sss = 624
                                        else
                                          if monthly_salary <= 5749.99 && monthly_salary >= 5250
                                            self.sss = 572
                                            if monthly_salary <= 5249.99 && monthly_salary >= 4750
                                              self.sss = 520
                                            else
                                              if monthly_salary <= 4749.99 && monthly_salary >= 4250
                                                self.sss = 468
                                              else
                                                if monthly_salary <= 4249.99 && monthly_salary >= 3750
                                                  self.sss = 416
                                                else
                                                  if monthly_salary <= 3749.99 && monthly_salary >= 3250
                                                    self.sss = 364
                                                  else
                                                    if monthly_salary <= 3249.99 && monthly_salary >= 2750
                                                      self.sss = 312
                                                    else
                                                      if monthly_salary <= 2749.99 && monthly_salary >= 2250
                                                        self.sss = 260
                                                      else
                                                        if monthly_salary <= 2249.99 && monthly_salary >= 1750
                                                          self.sss = 208
                                                        else
                                                          if monthly_salary <= 1749.99 && monthly_salary >= 1250
                                                            self.sss = 156
                                                          else
                                                            if monthly_salary <= 1249.99 && monthly_salary >= 1000
                                                              self.sss = 104
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

  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
end
