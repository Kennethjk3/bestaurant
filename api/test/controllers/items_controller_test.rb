require 'test_helper'

class Api::ItemsControllerTest < ActionController::TestCase

  def setup
    @item = items(:one)
  end

  test "GET index" do
    get :index, format: :json
    response_item = JSON.parse(response.body)[0]
    ['id', 'name', 'price', 'description', 'pic', 'category'].each do |attr|
      assert_equal @item.send(attr), response_item[attr]
      end
    assert_response :success
  end

  test "POST create an item" do
    assert_difference('Item.count', 1) do
      post :create, format: :json, item: { name: "Hashbrowns", price: 20, description: "potatos", pic: "picture", category: "Brokefest" }
    end
    assert_response :success
  end

  test "GET show an item" do
    get :show, id: @item, format: :json
    response_item = JSON.parse(response.body)
    ['id', 'name', 'price', 'description'].each do |attr|
      assert_equal @item.send(attr), response_item[attr]
    end
    assert_response :success
  end

  test "PATCH update an item" do
    patch :update, format: :json, id: @item, item: { name: "Bacon", price: 25, description: "Food sent from the Gods", pic: "~~ ~~", category: "Zeus-Food" }
    assert_response :success
  end

  test 'DELETE destroy does in fact destroy' do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item.id, format: :json
    end
  end

end
