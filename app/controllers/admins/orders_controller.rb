class Admins::OrdersController < ApplicationController
  layout 'admins'

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

end
