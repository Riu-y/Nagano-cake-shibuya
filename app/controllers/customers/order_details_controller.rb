class Customers::OrderDetailsController < ApplicationController
	layout 'customers'

	def new
		@order_detail = OrderDetail.new
		@customer = Customer.find(params[:customer_id])
		@delivery = ShippingAddress.new
  end


	def check
	end

	def create
		@order_detail = OrderDetail.new(order_detail_params)
		@customer = Customer.find(params[:customer_id])
		@customer_id =
		if  params[:select_address] == "ご自身の住所"
			@order_detail.shipping_postal_code = current_customer.shipping_postal_code
      @order_detail.shipping_address = current_customer.shipping_address
      @order_detail.shipping_name = current_customer.family_name + current_customer.first_name

			redirect_to customers_customer_path(current_customer)

    elsif params[:select_address] == "登録済住所から選択"
			@order_detail.shipping_postal_code = ShippingAddress.find(params[:id]).postal_code
			@order_detail.shipping_address = ShippingAddress.find(params[:id]).shipping_address
			@order_detail.shipping_name = ShippingAddress.find(params[:id]).name

			redirect_to products_path

		elsif params[:select_address] ==  "新しいお届け先"
			@shipping_address = ShippingAddress.new(shipping_address_params)
			@shirrong_address.customer_id = current_customer.id
			@shipping_address.save
			redirect_to admins_genres_path
		end
	end

	private

	def order_detail_params
		params.require(:order_detail).permit(:shipping_postal_code,:shipping_name,:shipping_address,:shipping_fee,:subtotal,:total_fee,:payment_method)
	end

	def shipping_address_params
		params.require(:shipping_address).permit(:shipping_postal_code,:shipping_name,:shipping_address)

	end
end


