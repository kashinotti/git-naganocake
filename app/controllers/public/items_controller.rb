class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(9)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])

    @cart_item = CartItem.new
  end
end
