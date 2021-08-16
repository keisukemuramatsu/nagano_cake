class Item < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :order_deteils, dependent: :destroy
    belongs_to :genre
    attachment :image
    enum is_active: { on_sale: 0, sales_end: 1 }
end
