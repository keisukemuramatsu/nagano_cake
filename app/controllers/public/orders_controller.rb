class Public::OrdersController < ApplicationController
    def new 
     @order = Order.new
    end
    def index
     @order_details = OrderDetail.all
    end
    def show
     @order_detail = OrderDetail.find(params[:id])
    end 
    def complete
        
    end
    def create
        @order_detail = OrderDetail.new
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save
        current_customer.cart_items.each do | cart_item |
            @order_detail.price = cart_item.item.add_tax_price
            @order_detail.amount = cart_item.amount
            @order_detail.making_status = 0
            @order_detail.item_id = cart_item.item.id
            @order_detail.order_id = @order.id
        end
        @order_detail.save
        # cart_item = current_customer.cart_items
        CartItem.where(customer_id: current_customer.id).destroy_all
        redirect_to complete_public_orders_path
    end
    def confirm
      @order = Order.new(order_params)
      if params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:select_address] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:select_address] == "2"
      end
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @shipping_cost = 800
    end
 private
    def order_params
        params.require(:order).permit(:payment_method, :postal_code, :address, :name, :status, :shipping_cost, :total_payment, :customer_id)
    end
end