class Customers::CartsController < ApplicationController
	layout 'customers'
	def create
		@customer = Customer.find(params[:customer_id])
		@cart = Cart.new(cart_params)
		@cart.customer_id = current_customer.id
		if @cart.save
			redirect_to customers_customer_carts_path(current_customer.id)
		else
			redirect_to products_path
		end
	end

	def show
		@customer = Customer.find(params[:customer_id])
		@carts = Cart.all
		@cart = Cart.new

	end

	def update
		@customer = Customer.find(params[:customer_id])
		@cart = Cart.find_by(params[:product_id])
		@cart.update(cart_params)
		redirect_to products_path
	end

	def destroy
		@customer = Customer.find(params[:customer_id])
		@cart = Cart.find_by(params[:product_id])
		@cart.destory
		redirect_to customers_customer_carts_path(@customer.id)
	end

	def alldestroy
		@customer = Customer.find(params[:customer_id])
		@carts = Cart.all
		@carts.destroy_all
		redirect_to customers_customer_carts_path(@customer.id)
	end

	def cart_params
  		params.require(:cart).permit(:number,:product_id)
  	end
end
