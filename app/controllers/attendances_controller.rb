class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.json

  before_filter :signed_in_employee

  def holidaypay
    if Attendance.last.holiday?
      Attendance.where('date LIKE ?', Date.today).update_all(holiday: false)
    else
      Attendance.where('date LIKE ?', Date.today).update_all(holiday: true)
    end
    redirect_to attendances_path
  end

  def index
    @attendances = Attendance.all.reverse
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance = Attendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(params[:attendance])

    respond_to do |format|
      if @attendance.save
        flash[:success] = "You have successfully timed in"
        format.html { redirect_to current_employee }
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        if Cutofftotalsalary.find_by_employee_name(@attendance.employee.name).nil?
          Cutofftotalsalary.find_by_employee_name(@attendance.employee.name).create(cutoff_id: Cutoff.last.id, name: @attendance.employee.name, salary_for_cutoff: @attendance.employee.cutoff)
        else
          Cutofftotalsalary.find_by_employee_name(@attendance.employee.name).update_attributes(cutoff_id: Cutoff.last.id, salary_for_cutoff: @attendance.employee.cutoff_salary)
        end
        format.html { redirect_to current_employee, notice: 'Attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :no_content }
    end
  end
end
