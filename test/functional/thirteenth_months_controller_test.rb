require 'test_helper'

class ThirteenthMonthsControllerTest < ActionController::TestCase
  setup do
    @thirteenth_month = thirteenth_months(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thirteenth_months)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thirteenth_month" do
    assert_difference('ThirteenthMonth.count') do
      post :create, thirteenth_month: { year: @thirteenth_month.year }
    end

    assert_redirected_to thirteenth_month_path(assigns(:thirteenth_month))
  end

  test "should show thirteenth_month" do
    get :show, id: @thirteenth_month
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thirteenth_month
    assert_response :success
  end

  test "should update thirteenth_month" do
    put :update, id: @thirteenth_month, thirteenth_month: { year: @thirteenth_month.year }
    assert_redirected_to thirteenth_month_path(assigns(:thirteenth_month))
  end

  test "should destroy thirteenth_month" do
    assert_difference('ThirteenthMonth.count', -1) do
      delete :destroy, id: @thirteenth_month
    end

    assert_redirected_to thirteenth_months_path
  end
end
