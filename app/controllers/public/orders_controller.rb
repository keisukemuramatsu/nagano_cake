class Public::OrdersController < ApplicationController
    def new 
     @order = Order.new
    end
    def index
        
    end
    def show
        
    end 
    def complete
        
    end
    def create
        
    end
    def confirm
     @order = Order.new(order_params)
     @address = Address.find(params[:order][:address_id])
     @order.postal_code = @address.postal_code
     @order.address = @address.address
     @order.name = @address.name
     @cart_items = CartItem.where(customer_id: current_customer.id)
    end
 private
    def order_params
        params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end
end
