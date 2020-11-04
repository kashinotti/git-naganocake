class Public::CartItemsController < ApplicationController
  
  def index
  end
  
  def create
    @cart_item = Cart_item.new(cart_items_params)
    @cart_item.save
    redirect_to  cart_items_path
  end
  
  
  
  private
  
  def cart_items_params
    params.require(:cart_item).permit(:count)
  end
  
end
