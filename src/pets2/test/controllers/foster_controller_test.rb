require 'test_helper'

class FosterControllerTest < ActionController::TestCase

  setup do
    @pet = pets(:one)
  end

  test "should get agreement" do
    get :agreement, :id => @pet
    assert_response :success
  end

  test "should get confirmation" do
    get :confirmation, :id => @pet
    assert_response :success
  end

end
