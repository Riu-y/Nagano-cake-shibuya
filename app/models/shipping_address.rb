class ShippingAddress < ApplicationRecord
	belongs_to :customer
end

	def full_address
		self.shipping_full_address = shipping_postal_code + shipping_address + shipping_name
	end
end