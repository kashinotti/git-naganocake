class Admins::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_items_params)
    redirect_to admins_orders_path
  end

  private

  def order_items_params
    params.require(:order_item).permit(:making_status)
  end

end
