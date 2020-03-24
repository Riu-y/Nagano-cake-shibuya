class Customers::HomesController < ApplicationController
	layout 'customers'
	def top
		@genres = Genre.all
		@products = Product.all
		@product1 = Product.find_by(id: 1)
		@product2 = Product.find_by(id: 2)
		@product3 = Product.find_by(id: 3)
		@product4 = Product.find_by(id: 4)
	end
end
