class ProductsController < ApplicationController
	layout 'customers'
	def index
		@genres = Genre.all
		@products = Product.all
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
		@cart = Cart.new
	end
		def genre_search
		@genres = Genre.all
		@genre = Genre.find(params[:id])
		@products = Product.where(genre_id: params[:id])
	end

	private

end
