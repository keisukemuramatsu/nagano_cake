class Public::ItemsController < ApplicationController
    def index
      @genres = Genre.all
      @items = Item.all
    end
    def show
      @cart_item = CartItem.new
      @genres = Genre.all
      @item = Item.find(params[:id])
    end
    
end
