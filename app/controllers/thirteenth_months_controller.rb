class ThirteenthMonthsController < ApplicationController
  # GET /thirteenth_months
  # GET /thirteenth_months.json

  def index
    @thirteenth_months = ThirteenthMonth.all
    if ThirteenthMonth.first.nil?
      ThirteenthMonth.create(year: Date.today.strftime("%Y").to_i)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thirteenth_months }
    end
  end

  # GET /thirteenth_months/1
  # GET /thirteenth_months/1.json
  def show
    @thirteenth_month = ThirteenthMonth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thirteenth_month }
    end
  end

  # GET /thirteenth_months/new
  # GET /thirteenth_months/new.json
  def new
    @thirteenth_month = ThirteenthMonth.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thirteenth_month }
    end
  end

  # GET /thirteenth_months/1/edit
  def edit
    @thirteenth_month = ThirteenthMonth.find(params[:id])
  end

  # POST /thirteenth_months
  # POST /thirteenth_months.json
  def create
    @thirteenth_month = ThirteenthMonth.new(params[:thirteenth_month])

    respond_to do |format|
      if @thirteenth_month.save
        format.html { redirect_to @thirteenth_month, notice: 'Thirteenth month was successfully created.' }
        format.json { render json: @thirteenth_month, status: :created, location: @thirteenth_month }
      else
        format.html { render action: "new" }
        format.json { render json: @thirteenth_month.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thirteenth_months/1
  # PUT /thirteenth_months/1.json
  def update
    @thirteenth_month = ThirteenthMonth.find(params[:id])

    respond_to do |format|
      if @thirteenth_month.update_attributes(params[:thirteenth_month])
        format.html { redirect_to @thirteenth_month, notice: 'Thirteenth month was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thirteenth_month.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thirteenth_months/1
  # DELETE /thirteenth_months/1.json
  def destroy
    @thirteenth_month = ThirteenthMonth.find(params[:id])
    @thirteenth_month.destroy

    respond_to do |format|
      format.html { redirect_to thirteenth_months_url }
      format.json { head :no_content }
    end
  end
end
