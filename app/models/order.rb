class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy
  belongs_to :customer
  enum order_status: { 
    waiting_for_payment: 0,
    payment_confirmation: 1,
    making: 2, 
    preparing_to_ship: 3,
    sent: 4
  }
  
  enum payment_method: {
    credit_card: 0,
    bank: 1
  }
end
