class Admins::ProductsController < ApplicationController
	before_action :authenticate_admin!
	layout 'admins'

	def index
		@products = Product.all.page(params[:page]).per(10)
	end

	def new
		@product = Product.new
		@genre = Genre.all
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_products_path
		else
			render action: :new
		end
	end

	def show
		@product = Product.find(params[:id])
		@genre = @product.genre
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admins_product_path(@product.id)
		else
			render action: :edit
		end
	end

	private
	def product_params
		params.require(:product).permit(:genre_id, :product_name, :product_image, :product_description, :unit_price, :is_selling)
	end
end
