class OrderItem < ApplicationRecord
	enum status:{cannot: 0, waiting: 1, doing: 2, done: 3}
end
