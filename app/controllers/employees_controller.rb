class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.json

  before_filter :prevent_employee_access, only: [:new, :create, :destroy, :index]

  def authorizetoggling
    @admin = Employee.find(params[:id])
    @admin.toggle!(:authorizetoggling)
    redirect_to employees_path
  end

  def authorizeovertime
    @user = Employee.find(params[:id])
    @user.toggle!(:authorized_overtime)
    redirect_to employees_path
  end

  def index
    @employees = Employee.all.sort { |a, b| a.name.downcase <=> b.name.downcase }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    @attendance = Employee.new.attendances.build(params[:attendance])
    @taxable_income = @employee.cutoff_salary - (@employee.sss + @employee.philhealth + @employee.pagibig)
    @withholding_tax = ((@taxable_income - 15833) * 0.25) + 1875
    @marrital_status = ["Single", "Married"]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        Cutofftotalsalary.create(cutoff_id: Cutoff.last.id, employee_name: @employee.name, sss: @employee.sss, philhealth: @employee.philhealth, pagibig: @employee.pagibig, withholding_tax: @employee.withholding_tax)
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        Cutofftotalsalary.find_by_employee_name(@employee.name).update_attributes(cutoff_id: Cutoff.last.id, employee_name: @employee.name, sss: @employee.sss, philhealth: @employee.philhealth, pagibig: @employee.pagibig, withholding_tax: @employee.withholding_tax)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end
end
