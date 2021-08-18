class Admin::CustomersController < ApplicationController
    def index 
        @customers = Customer.all
    end
    def edit
        @customer = Customer.find(params[:id])
    end
    def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)
        redirect_to admin_customers_path, notice: "更新しました."
    end
    def show
        @customer = Customer.find(params[:id])
    end
  private
    def customer_params
      params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
    end
end
