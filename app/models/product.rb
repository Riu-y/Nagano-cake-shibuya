class Product < ApplicationRecord
	attachment :product_image
	mount_uploader :product_image, ProductImageUploader
	belongs_to :genre
	has_many :ordered_items
	has_many :carts, dependent: :destroy

	validates :product_name, presence: true
	validates :unit_price, presence: true
	validates :product_description,length: {maximum: 50}


end
