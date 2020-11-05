class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_items_params)
    # @cart_item = Cart_item.new(cart_items_params)
    @cart_item.save
    redirect_to  cart_items_path
  end



  private

  def cart_items_params
    params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end

end
