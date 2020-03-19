class Admins::ProductsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
		@genre = Genre.all
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_product_path(@product.id)
		else
			@products = Product.all
			render action: :index
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
		@product.update(product_params)
		redirect_to admins_product_path(@product.id)
	end

	private
	def product_params
		params.require(:product).permit(:genre_id, :product_name, :product_image, :product_description, :unit_price, :is_selling)
	end
end
