require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { alcoholic_strength: @product.alcoholic_strength, brand: @product.brand, cost_price: @product.cost_price, description: @product.description, factory: @product.factory, flavour_type: @product.flavour_type, materials: @product.materials, name: @product.name, net_content: @product.net_content, producing_area: @product.producing_area, promotion_price: @product.promotion_price, specification: @product.specification, specification_box: @product.specification_box, store_condition: @product.store_condition, thumbnail: @product.thumbnail, title: @product.title }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { alcoholic_strength: @product.alcoholic_strength, brand: @product.brand, cost_price: @product.cost_price, description: @product.description, factory: @product.factory, flavour_type: @product.flavour_type, materials: @product.materials, name: @product.name, net_content: @product.net_content, producing_area: @product.producing_area, promotion_price: @product.promotion_price, specification: @product.specification, specification_box: @product.specification_box, store_condition: @product.store_condition, thumbnail: @product.thumbnail, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
