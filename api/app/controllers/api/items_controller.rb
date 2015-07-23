class Api::ItemsController < ApplicationController

  def index
    @items = Item.all
    respond_to do |format|
      format.json { render json: @items }
    end
  end

  def show
    @item = find_item
    respond_to do |format|
      format.json { render json: @item }
    end
  end

  def create
   @item = Item.new(item_params)
   respond_to do |format|
     if @item.save
       format.json { render status: 200, json: @item }
     else
       format.json { render json: @item.errors.full_messages, status: 400 }
     end
   end
 end

  def edit
    @item = find_item
    respond_to do |format|
      if @item.save
        format.json { render status: created, json: @item }
      else
        format.json { render json: @item.errors.full_messages, status: 400 }
      end
    end
  end

   def update
    @item = find_item
    respond_to do |format|
      if @item.update_attributes(item_params)
        format.json { render status: 200, json: @item}
      else
        format.json { render json: @item.errors.full_messages, status: unprocessable_entity }
      end
    end
  end

   def destroy
    @item = find_item
    @item.destroy
     respond_to do |format|
      format.json { head :no_content, status: 202 }
    end
  end

  private

  def find_item
    Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :pic, :category)
  end

end
