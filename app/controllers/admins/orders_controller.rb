class Admins::OrdersController < ApplicationController
  layout 'admins'

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
    # @order.update(orders_params)
    
    if @order.update(orders_params)

      if @order.order_status == "入金確認"

        @order_items.each do |order_item|
         order_item.update(making_status: "制作待ち")
        end
      end
    end
    redirect_to admins_order_path
  end

  private

  def orders_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :order_status, :payment_method, :customer_id)
  end

end
