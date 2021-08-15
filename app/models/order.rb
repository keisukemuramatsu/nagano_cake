class Order < ApplicationRecord
    has_many :order_deteils, dependent: :destroy
    belongs_to :customer
end
