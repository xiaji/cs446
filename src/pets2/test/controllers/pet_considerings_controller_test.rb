require 'test_helper'

class PetConsideringsControllerTest < ActionController::TestCase
  setup do
    @pet_considering = pet_considerings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_considerings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_considering" do
    assert_difference('PetConsidering.count') do
      post :create, pet_id: pets(:one).id
    end

    assert_redirected_to animal_display_path
  end

  test "should show pet_considering" do
    get :show, id: @pet_considering
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_considering
    assert_response :success
  end

  test "should update pet_considering" do
    patch :update, id: @pet_considering, pet_considering: { pet_id: @pet_considering.pet_id }
    assert_redirected_to pet_considering_path(assigns(:pet_considering))
  end

  test "should destroy pet_considering" do
    assert_difference('PetConsidering.count', -1) do
      delete :destroy, id: @pet_considering
    end

    assert_redirected_to pet_considerings_path
  end

  test "should create pet_considering via ajax" do
    assert_difference('PetConsidering.count') do
      xhr :post, :create, pet_id: pets(:one).id
    end

    assert_response :success
    assert_select_jquery :html, '#considering' do
      assert_select 'tr#current td', /Pinky/
    end
  end
end
