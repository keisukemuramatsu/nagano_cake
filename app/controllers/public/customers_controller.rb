class Public::CustomersController < ApplicationController
    def show
        @customer = current_customer
    end
    def unsubscribe
        @customer = current_customer
    end

    def withdraw
        @customer = Customer.find(current_customer.id)
        @customer.update(is_deleted: false)
        reset_session
        redirect_to :public_root_path
    end
private
    def customer_params
      params.permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
    end
end
