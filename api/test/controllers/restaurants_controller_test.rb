require 'test_helper'

class Api::RestaurantsControllerTest < ActionController::TestCase

  def setup
    @restaurant = restaurants(:one)
  end

  test "GET index" do
    get :index, format: :json
    response_restaurant = JSON.parse(response.body)[0]
    ['id', 'name', 'location', 'cuisine'].each do |attr|
      assert_equal @restaurant.send(attr), response_restaurant[attr]
      end
    assert_response :success
  end

  test "POST create an restaurant" do
    assert_difference('Restaurant.count', 1) do
      post :create, format: :json, restaurant: { name: "Rest or Raunt", location: "Charleston", cuisine: "Brokefest"}
    end
    assert_response :success
  end

  test "GET show an restaurant" do
    get :show, id: @restaurant, format: :json
    response_restaurant = JSON.parse(response.body)
    ['id', 'name', 'location', 'cuisine'].each do |attr|
      assert_equal @restaurant.send(attr), response_restaurant[attr]
    end
    assert_response :success
  end

  test "PATCH update an restaurant" do
    patch :update, format: :json, id: @restaurant, restaurant: { name: "test or Raunt", location: "Charlestest", cuisine: "Broketest"}
    assert_response :success
  end

  test 'DELETE destroy does in fact destroy' do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant.id, format: :json
    end
  end

end
