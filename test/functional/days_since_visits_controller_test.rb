require 'test_helper'

class DaysSinceVisitsControllerTest < ActionController::TestCase
  setup do
    @days_since_visit = days_since_visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:days_since_visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create days_since_visit" do
    assert_difference('DaysSinceVisit.count') do
      post :create, :days_since_visit => @days_since_visit.attributes
    end

    assert_redirected_to days_since_visit_path(assigns(:days_since_visit))
  end

  test "should show days_since_visit" do
    get :show, :id => @days_since_visit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @days_since_visit.to_param
    assert_response :success
  end

  test "should update days_since_visit" do
    put :update, :id => @days_since_visit.to_param, :days_since_visit => @days_since_visit.attributes
    assert_redirected_to days_since_visit_path(assigns(:days_since_visit))
  end

  test "should destroy days_since_visit" do
    assert_difference('DaysSinceVisit.count', -1) do
      delete :destroy, :id => @days_since_visit.to_param
    end

    assert_redirected_to days_since_visits_path
  end
end
