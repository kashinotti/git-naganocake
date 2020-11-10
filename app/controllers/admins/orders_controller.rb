class Admins::OrdersController < ApplicationController
  layout 'admins'

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(orders_params)
    redirect_to admins_orders_path
  end

  private

  def orders_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :order_status, :payment_method, :customer_id)
  end

end
