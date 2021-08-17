class Item < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :order_deteils, dependent: :destroy
    belongs_to :genre
    attachment :image
    enum is_active: { on_sale: true, sales_end: false }
    def add_tax_price
        (self.price * 1.1).round
    end
end
