class Product < ApplicationRecord
	attachment :product_image
	belongs_to :genre
	has_many :ordered_items
	has_many :carts, dependent: :destroy
end
