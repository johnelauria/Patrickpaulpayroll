require 'test_helper'

class ThirteenthMonthPaysControllerTest < ActionController::TestCase
  setup do
    @thirteenth_month_pay = thirteenth_month_pays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thirteenth_month_pays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thirteenth_month_pay" do
    assert_difference('ThirteenthMonthPay.count') do
      post :create, thirteenth_month_pay: { amount: @thirteenth_month_pay.amount, employee_name: @thirteenth_month_pay.employee_name, year: @thirteenth_month_pay.year }
    end

    assert_redirected_to thirteenth_month_pay_path(assigns(:thirteenth_month_pay))
  end

  test "should show thirteenth_month_pay" do
    get :show, id: @thirteenth_month_pay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thirteenth_month_pay
    assert_response :success
  end

  test "should update thirteenth_month_pay" do
    put :update, id: @thirteenth_month_pay, thirteenth_month_pay: { amount: @thirteenth_month_pay.amount, employee_name: @thirteenth_month_pay.employee_name, year: @thirteenth_month_pay.year }
    assert_redirected_to thirteenth_month_pay_path(assigns(:thirteenth_month_pay))
  end

  test "should destroy thirteenth_month_pay" do
    assert_difference('ThirteenthMonthPay.count', -1) do
      delete :destroy, id: @thirteenth_month_pay
    end

    assert_redirected_to thirteenth_month_pays_path
  end
end
