require 'test_helper'

class UsersControllerTest < ActionController::TestCase


  test "should create new user account when a request comes in from an unknown number" do
    #require 'pry'
    #binding.pry
     assert User.where(phone: '1234567890').first == nil, "user exists!"
     post :ride_request, {:phone_number => "1234567890", :body => "LOCATION_STRING"}
     assert User.where(phone: '1234567890').first != nil, "user wasn't created!"
  end
=begin
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { name: @user.name, phone: @user.phone }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { name: @user.name, phone: @user.phone }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
=end 
end
