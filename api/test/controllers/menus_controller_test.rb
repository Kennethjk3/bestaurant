require 'test_helper'

class Api::MenusControllerTest < ActionController::TestCase

  def setup
    @menu = menus(:one)
  end

  test "GET index" do
    get :index, format: :json
    response_menu = JSON.parse(response.body)[0]
    ['id', 'restaurant_id', 'item_id'].each do |attr|
      assert_equal @menu.send(attr), response_menu[attr]
      end
    assert_response :success
  end

  # test "POST create an menu" do
  #   assert_difference('Menu.count', 1) do
  #     post :create, format: :json, menu: { restaurant_id: 2, item_id: 2}
  #   end
  #   assert_response :success
  # end

  test "GET show an menu" do
    get :show, id: @menu, format: :json
    response_menu = JSON.parse(response.body)
    ['id', 'restaurant_id', 'item_id'].each do |attr|
      assert_equal @menu.send(attr), response_menu[attr]
    end
    assert_response :success
  end

  # test "PATCH update an menu" do
  #   patch :update, format: :json, id: @menu, menu: {restaurant_id: 3, item_id: 3 }
  #   assert_response :success
  # end

  test 'DELETE destroy does in fact destroy' do
    assert_difference('Menu.count', -1) do
      delete :destroy, id: @menu.id, format: :json
    end
  end

end
