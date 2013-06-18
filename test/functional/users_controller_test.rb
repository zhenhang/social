require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get setting" do
    get :setting
    assert_response :success
  end

  test "should get avatar" do
    get :avatar
    assert_response :success
  end

  test "should get favs" do
    get :favs
    assert_response :success
  end

  test "should get topics" do
    get :topics
    assert_response :success
  end

  test "should get replies" do
    get :replies
    assert_response :success
  end

end
