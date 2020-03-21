class ProductsController < ApplicationController
	layout 'customers'
	def index
		@genres = Genre.all
		@products = Product.all
	end

	def genre_search
		@genres = Genre.all
		@products = Product.where(genre_id: params[:id])
		# @products = Product.find(params[:genre_id)
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
	end
end
