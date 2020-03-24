class Customers::HomesController < ApplicationController
	layout 'customers'
	def top
		@genres = Genre.all
		@products = Product.all
		
	end
end
