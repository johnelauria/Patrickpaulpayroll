class ThirteenthMonthPaysController < ApplicationController
  # GET /thirteenth_month_pays
  # GET /thirteenth_month_pays.json
  def index
    @thirteenth_month_pays = ThirteenthMonthPay.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thirteenth_month_pays }
    end
  end

  # GET /thirteenth_month_pays/1
  # GET /thirteenth_month_pays/1.json
  def show
    @thirteenth_month_pay = ThirteenthMonthPay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thirteenth_month_pay }
    end
  end

  # GET /thirteenth_month_pays/new
  # GET /thirteenth_month_pays/new.json
  def new
    @thirteenth_month_pay = ThirteenthMonthPay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thirteenth_month_pay }
    end
  end

  # GET /thirteenth_month_pays/1/edit
  def edit
    @thirteenth_month_pay = ThirteenthMonthPay.find(params[:id])
  end

  # POST /thirteenth_month_pays
  # POST /thirteenth_month_pays.json
  def create
    @thirteenth_month_pay = ThirteenthMonthPay.new(params[:thirteenth_month_pay])

    respond_to do |format|
      if @thirteenth_month_pay.save
        format.html { redirect_to @thirteenth_month_pay, notice: 'Thirteenth month pay was successfully created.' }
        format.json { render json: @thirteenth_month_pay, status: :created, location: @thirteenth_month_pay }
      else
        format.html { render action: "new" }
        format.json { render json: @thirteenth_month_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thirteenth_month_pays/1
  # PUT /thirteenth_month_pays/1.json
  def update
    @thirteenth_month_pay = ThirteenthMonthPay.find(params[:id])

    respond_to do |format|
      if @thirteenth_month_pay.update_attributes(params[:thirteenth_month_pay])
        format.html { redirect_to @thirteenth_month_pay, notice: 'Thirteenth month pay was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thirteenth_month_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thirteenth_month_pays/1
  # DELETE /thirteenth_month_pays/1.json
  def destroy
    @thirteenth_month_pay = ThirteenthMonthPay.find(params[:id])
    @thirteenth_month_pay.destroy

    respond_to do |format|
      format.html { redirect_to thirteenth_month_pays_url }
      format.json { head :no_content }
    end
  end
end
