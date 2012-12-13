require 'test_helper'

class CutofftotalsalariesControllerTest < ActionController::TestCase
  setup do
    @cutofftotalsalary = cutofftotalsalaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cutofftotalsalaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cutofftotalsalary" do
    assert_difference('Cutofftotalsalary.count') do
      post :create, cutofftotalsalary: { cutoff_id: @cutofftotalsalary.cutoff_id, employee_name: @cutofftotalsalary.employee_name, philhealth: @cutofftotalsalary.philhealth, salary_for_cutoff: @cutofftotalsalary.salary_for_cutoff, sss: @cutofftotalsalary.sss }
    end

    assert_redirected_to cutofftotalsalary_path(assigns(:cutofftotalsalary))
  end

  test "should show cutofftotalsalary" do
    get :show, id: @cutofftotalsalary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cutofftotalsalary
    assert_response :success
  end

  test "should update cutofftotalsalary" do
    put :update, id: @cutofftotalsalary, cutofftotalsalary: { cutoff_id: @cutofftotalsalary.cutoff_id, employee_name: @cutofftotalsalary.employee_name, philhealth: @cutofftotalsalary.philhealth, salary_for_cutoff: @cutofftotalsalary.salary_for_cutoff, sss: @cutofftotalsalary.sss }
    assert_redirected_to cutofftotalsalary_path(assigns(:cutofftotalsalary))
  end

  test "should destroy cutofftotalsalary" do
    assert_difference('Cutofftotalsalary.count', -1) do
      delete :destroy, id: @cutofftotalsalary
    end

    assert_redirected_to cutofftotalsalaries_path
  end
end
