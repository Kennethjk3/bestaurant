class ItemsController < ApplicationController
  def index
    @items = Item.all
    binding.pry
  end
end
