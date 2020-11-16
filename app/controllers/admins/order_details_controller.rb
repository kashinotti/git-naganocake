class Admins::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.find(params[:id])
    count = 0
    if @order_item.update(order_items_params)

      if @order_item.making_status == "制作中"
        @order.update(order_status: "制作中")
      end

      @order.order_items.each do |order_item|
        if order_item.making_status == "制作完了"
          count += 1
        end
      end
      if count == @order.order_items.count
        @order.update(order_status: "発送準備中")
      end
    end
    redirect_to admins_order_path(@order.id)
  end

  private

  def order_items_params
    params.require(:order_item).permit(:making_status)
  end

end
