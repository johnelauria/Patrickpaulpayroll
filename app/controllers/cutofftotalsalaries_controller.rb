class CutofftotalsalariesController < ApplicationController
  # GET /cutofftotalsalaries
  # GET /cutofftotalsalaries.json

  before_filter :signed_in_employee
  before_filter :prevent_access

  def index
    @cutofftotalsalaries = Cutofftotalsalary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cutofftotalsalaries }
    end
  end

  # GET /cutofftotalsalaries/1
  # GET /cutofftotalsalaries/1.json
  def show
    @cutofftotalsalary = Cutofftotalsalary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cutofftotalsalary }
    end
  end

  # GET /cutofftotalsalaries/new
  # GET /cutofftotalsalaries/new.json
  def new
    @cutofftotalsalary = Cutofftotalsalary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cutofftotalsalary }
    end
  end

  # GET /cutofftotalsalaries/1/edit
  def edit
    @cutofftotalsalary = Cutofftotalsalary.find(params[:id])
  end

  # POST /cutofftotalsalaries
  # POST /cutofftotalsalaries.json
  def create
    @cutofftotalsalary = Cutofftotalsalary.new(params[:cutofftotalsalary])

    respond_to do |format|
      if @cutofftotalsalary.save
        format.html { redirect_to @cutofftotalsalary, notice: 'Cutofftotalsalary was successfully created.' }
        format.json { render json: @cutofftotalsalary, status: :created, location: @cutofftotalsalary }
      else
        format.html { render action: "new" }
        format.json { render json: @cutofftotalsalary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cutofftotalsalaries/1
  # PUT /cutofftotalsalaries/1.json
  def update
    @cutofftotalsalary = Cutofftotalsalary.find(params[:id])

    respond_to do |format|
      if @cutofftotalsalary.update_attributes(params[:cutofftotalsalary])
        format.html { redirect_to @cutofftotalsalary, notice: 'Cutofftotalsalary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cutofftotalsalary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cutofftotalsalaries/1
  # DELETE /cutofftotalsalaries/1.json
  def destroy
    @cutofftotalsalary = Cutofftotalsalary.find(params[:id])
    @cutofftotalsalary.destroy

    respond_to do |format|
      format.html { redirect_to cutofftotalsalaries_url }
      format.json { head :no_content }
    end
  end
end
