class Public::AddressesController < ApplicationController
    def index
        @customer = Customer.find(current_customer.id)
        @addresses = Address.all
        @newaddress = Address.new
    end
    
    def create
         @newaddress = Address.new(address_params)
         @newaddress.customer_id = current_customer.id
         @newaddress.save
         redirect_to public_addresses_path, notice: "追加しました."
    end
    
    def edit
      @address = Address.find(params[:id])
    end
    def update
      @address = Address.find(params[:id])
      @address.update(address_params)
      redirect_to public_addresses_path, notice: "更新しました."
    end
    def destroy
      @address = Address.find(params[:id])
      @address.destroy
      redirect_to public_addresses_path
    end
  private
    def address_params
        params.require(:address).permit(:name,:postal_code,:address,:customer_id)
    end
end
