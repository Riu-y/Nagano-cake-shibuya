class Customers::CartsController < ApplicationController
	layout 'customers'
	def create
		@cart = Cart.find_by(customer_id: current_customer.id, product_id: params[:cart][:product_id])
		# 同じ商品が入っている場合は追加しない
		if @cart.present?
			redirect_to customers_customer_carts_path(current_customer.id),alert:"選択した商品はすでにカートに入っています。"
		else
			@cart = Cart.new(cart_params)
			@cart.customer_id = current_customer.id
			@cart.save
			redirect_to customers_customer_carts_path(current_customer.id),notice:"商品をカートに追加しました。"
		end
	end

	def index
		@customer = current_customer
		@carts = Cart.all
		@cart = Cart.new
	end

	def update
		@customer = current_customer
		@cart = Cart.find_by(customer_id: @customer.id,id: params[:id])
		# binding.pry
		@cart.update(cart_params)
		redirect_to customers_customer_carts_path(current_customer.id)
	end

	def destroy
		@customer = current_customer
		@cart = Cart.find_by(customer_id: @customer.id,id: params[:id])
		@cart.destroy
		redirect_to customers_customer_carts_path(@customer.id)
	end

	def alldestroy
		@customer = current_customer
		@carts = Cart.all
		@carts.destroy_all
		redirect_to customers_customer_carts_path(@customer.id)
	end

	private

	def cart_params
  		params.require(:cart).permit(:number,:product_id)
  	end
end
