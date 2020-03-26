class ShippingAddress < ApplicationRecord
  	belongs_to :customer

	validates :shipping_postal_code, presence: true
	validates :shipping_address, presence: true
	validates :shipping_name, presence: true

	def full_address
		shipping_postal_code + shipping_address + shipping_name
	end
end