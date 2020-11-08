class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @order.payment_method = params[:payment_method]
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

    redirect_to orders_complete_path

  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def orders_params
    params.require(:order).permit(:postal_code, :address,:payment_method, :name, :shipping_cost, :total_payment, :order_status, :customer_id)
  end

end
