class Api::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    respond_to do |format|
      format.json { render json: @restaurants }
    end
  end

  def show
    @restaurant = find_restaurant
    respond_to do |format|
      format.json { render json: @restaurant }
    end
  end

  def create
   @restaurant = Restaurant.new(restaurant_params)
   respond_to do |format|
     if @restaurant.save
       format.json { render status: 200, json: @restaurant }
     else
       format.json { render json: @restaurant.errors.full_messages, status: 400 }
     end
   end
 end

  def edit
    @restaurant = find_restaurant
    respond_to do |format|
      if @restaurant.save
        format.json { render status: created, json: @restaurant }
      else
        format.json { render json: @restaurant.errors.full_messages, status: 400 }
      end
    end
  end

   def update
    @restaurant = find_restaurant
    respond_to do |format|
      if @restaurant.update_attributes(restaurant_params)
        format.json { render status: 200, json: @restaurant}
      else
        format.json { render json: @restaurant.errors.full_messages, status: unprocessable_entity }
      end
    end
  end

   def destroy
    @restaurant = find_restaurant
    @restaurant.destroy
     respond_to do |format|
      format.json { head :no_content, status: 202 }
    end
  end

  private

  def find_restaurant
    Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :cuisine)
  end

end
