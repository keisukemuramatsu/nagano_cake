class Item < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :order_deteils, dependent: :destroy
    belongs_to :genre
end
