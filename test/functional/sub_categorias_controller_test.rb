require 'test_helper'

class SubCategoriasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_categorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_categoria" do
    assert_difference('SubCategoria.count') do
      post :create, :sub_categoria => { }
    end

    assert_redirected_to sub_categoria_path(assigns(:sub_categoria))
  end

  test "should show sub_categoria" do
    get :show, :id => sub_categorias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sub_categorias(:one).to_param
    assert_response :success
  end

  test "should update sub_categoria" do
    put :update, :id => sub_categorias(:one).to_param, :sub_categoria => { }
    assert_redirected_to sub_categoria_path(assigns(:sub_categoria))
  end

  test "should destroy sub_categoria" do
    assert_difference('SubCategoria.count', -1) do
      delete :destroy, :id => sub_categorias(:one).to_param
    end

    assert_redirected_to sub_categorias_path
  end
end
