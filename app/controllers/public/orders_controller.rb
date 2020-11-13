class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @order.payment_method = params[:payment_method].to_i
    @cart_items = current_customer.cart_items

    case params[:select_address].to_i

    when 1
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    when 3
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    end

    render :confirm
  end

  def create
    @order = Order.new(orders_params)
    @order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_items = OrderItem.new(order_items_params)
      @order_items.count = cart_item.count
      @order_items.item_id = cart_item.item_id
      @order_items.order_id = @order.id
      @order_items.tax_in_purchased_price = cart_item.item.non_taxed_price * 1.1
      @order_items.save
    end

    current_customer.cart_items.destroy_all

    redirect_to orders_complete_path

  end

  def complete
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  private

  def orders_params
    params.require(:order).permit(:postal_code, :address,:payment_method, :name, :shipping_cost, :total_payment, :order_status, :customer_id)
  end

  def order_items_params
    params.permit(:count, :item_id, :order_id, :making_status, :tax_in_purchased_price)
  end
end