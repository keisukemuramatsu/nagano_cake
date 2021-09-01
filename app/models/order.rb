class Order < ApplicationRecord
    has_many :order_deteils, dependent: :destroy
    belongs_to :customer
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { before_payment: 0, paid: 1, preparing_delivery: 2, delivered:3 }
end
