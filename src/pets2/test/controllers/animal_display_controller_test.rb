require 'test_helper'

class AnimalDisplayControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "markup needed for animal_display.js.coffee is in place" do
    get :index
    assert_select '.animal_display .entry > img', 2
    assert_select '.entry input[type=submit]', 4
  end

end
