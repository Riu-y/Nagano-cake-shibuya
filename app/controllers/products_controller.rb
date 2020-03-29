class ProductsController < ApplicationController
	before_action :authenticate_customer!, only: [:show]
	layout 'customers'
	def index
		@genres = Genre.all
		@products = Product.all.page(params[:page]).reverse_order.per(8)
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
		@cart = Cart.new
		if @product.is_selling == false
			redirect_to products_path, alert:"選択した商品は売り切れです"
		end
	end

	def genre_search
		@genres = Genre.all
		@genre = Genre.find(params[:id])
		@products = Product.where(genre_id: params[:id])
	end
end
