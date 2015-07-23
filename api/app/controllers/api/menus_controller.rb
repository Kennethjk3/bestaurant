class Api::MenusController < ApplicationController

  def index
    @menus = Menu.all
    respond_to do |format|
      format.json { render json: @menus }
    end
  end

  def show
    @menu = find_menu
    respond_to do |format|
      format.json { render json: @menu }
    end
  end

  def create
    @menu = Menu.new(menu_params)
    @meun.item_id = restaurant_id
    @menu.item = Item.find(params[:item_id])
    respond_to do |format|
      if @menu.save
        format.json { render status: 200, json: @menu }
      else
        format.json { render json: @menu.errors.full_messages, status: 400 }
      end
    end
  end

  def edit
    @menu = find_menu
    respond_to do |format|
      if @menu.save
        format.json { render status: created, json: @menu }
      else
        format.json { render json: @menu.errors.full_messages, status: 400 }
      end
    end
  end

   def update
    @menu = find_menu
    respond_to do |format|
      if @menu.update_attributes(menu_params)
        format.json { render status: 200, json: @menu}
      else
        format.json { render json: @menu.errors.full_messages, status: unprocessable_entity }
      end
    end
  end

   def destroy
    @menu = find_menu
    @menu.destroy
     respond_to do |format|
      format.json { head :no_content, status: 202 }
    end
  end

  private

  def find_menu
    Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:restaurant_id, :item_id)
  end

end
