class Public::CartItemsController < ApplicationController
    def index
      return if session[:cart_item].blank?

      @cart_item = []
      session[:cart_item].each do |cart_item|
        item = Item.find_by(id: cart_item["item_id"])
        sub_total = item.price * cart_item["amount"].to_i
        next unless item

        @cart_item.push({ item_id: item.id,
                   name: item.item_name,
                   price: item.price,
                   quantity: cart_item["amount"].to_i,
                   sub_total: sub_total })
      end
      @cart_item_total_price = cart_item_total_price(@cart_item)
    end

  def create
    if session[:cart_item].blank?
      session[:cart_item] = [{ item_id: params["item_id"], amount: params["amount"].to_i }]
      return redirect_to public_cart_items_path
    end
    match = session[:cart_item].select {|cart_item| cart_item["item_id"] == params["item_id"] }
    if match.present?
      match[0]["amount"] += params["amount"].to_i
    else
      session[:cart_item].push({ item_id: params["item_id"], quantity: params["amount"].to_i })
    end
    redirect_to public_cart_items_path
  end

  # カート内商品の数量変更
  def change_quantity
    array_index = session[:cart].each_index.select {|i| session[:cart][i]["product_id"] == params["product_id"] }
    session[:cart][array_index[0]]["quantity"] = params["quantity"]
    redirect_to carts_show_path
  end

  # カート内商品の削除
  def destroy_carts_item
    array_index = session[:cart].each_index.select {|i| session[:cart][i]["product_id"] == params["product_id"] }
    session[:cart].delete_at(array_index[0])
    redirect_to carts_show_path
  end

  # カート内商品の合計金額の計算
  def cart_total_price(cart)
    cart.sum { _1[:sub_total] }
  end
end
