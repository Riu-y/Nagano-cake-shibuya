class OrderDetail < ApplicationRecord
  belongs_to :customer

	enum order_status:{
    wait_deposit: 0, #入金待ち
    payment_confirmation: 1, #入金確認
    inproduction: 2, #制作中
    preparing_for_shipment: 3, #発送準備中
    sent: 4, #発送済み
  }
  enum payment_method:{
    bank_transfer: 0, #銀行振込
    credit: 1, #クレジット払い
  }

  validates :payment_method, presence: true
  # validates :shipping_postal_code, presence: true
  # validates :shipping_address, presence: true
  # validates :shipping_name, presence: true
end
