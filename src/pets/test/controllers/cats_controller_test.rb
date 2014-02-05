require 'test_helper'

class CatsControllerTest < ActionController::TestCase
  setup do
    @cat = cats(:one)
    @update = {
      name: 'Kitty',
      breed: 'Test',
      age: 2,
      gender:'M',
      image_url:   'cupcake.jpg',
      description: 'Kitty is a little cupcake',
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cat" do
    assert_difference('Cat.count') do
      post :create, cat: @update
    end

    assert_redirected_to cat_path(assigns(:cat))
  end

  test "should show cat" do
    get :show, id: @cat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cat
    assert_response :success
  end

  test "should update cat" do
    patch :update, id: @cat, cat: @update
    assert_redirected_to cat_path(assigns(:cat))
  end

  test "should destroy cat" do
    assert_difference('Cat.count', -1) do
      delete :destroy, id: @cat
    end

    assert_redirected_to cats_path
  end
end
