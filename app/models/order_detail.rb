class OrderDetail < ApplicationRecord
    belongs_to :item
    belongs_to :order
    enum making_status: { production_pending: 0, in_prodaution: 1, production_complete: 2 }
    def order_detail_sub_total
     price * amount.to_i
    end
end
