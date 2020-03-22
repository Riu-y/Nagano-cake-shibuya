class Cart < ApplicationRecord
	belongs_to :producut
	belongs_to :customer
end
