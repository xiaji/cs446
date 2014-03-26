require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 3
    assert_select '#main .entry', 3

    assert_select '.gender', /[FM]/

  end

end
