class OrderItem < ApplicationRecord
	belongs_to :order_detail
	belongs_to :product

	enum status:{cannot: 0, waiting: 1, doing: 2, done: 3}
end
