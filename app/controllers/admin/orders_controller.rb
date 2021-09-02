class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
        @sum = 0
        @order.order_details.each do |order_detail|
         @sum += order_detail.order_detail_sub_total
        end
    end
    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to admin_root_path
    end
  private
    def order_params
        params.require(:order).permit(:status)
    end
end
