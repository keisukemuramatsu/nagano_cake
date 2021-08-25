class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    def sub_total
     item.add_tax_price * amount.to_i
    end
end
