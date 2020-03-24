class Customers::OrderDetailsController < ApplicationController
	layout 'customers'

	def new
		@order_detail = OrderDetail.new
		@customer = Customer.find(params[:customer_id])
		@delivery = ShippingAddress.new
		# @all_address = @customer.shipping_addresses
  end


	def check
		@carts = Cart.all
		@customer = current_customer
		@order_detail = OrderDetail.find_by(customer_id: current_customer.id, id: params[:id])
	end

	def create
		@order_detail = OrderDetail.new(order_detail_params)
		@customer = current_customer
		@order_detail.customer_id = current_customer.id

		if  params[:select_address] == "ご自身の住所"
			@order_detail.shipping_postal_code = current_customer.postal_code
      @order_detail.shipping_address = current_customer.address
      @order_detail.shipping_name = current_customer.family_name + current_customer.first_name


    elsif params[:select_address] == "登録済み住所から選択"
    	@shipping_address = ShippingAddress.find(params[:detail][:shipping_address_id])
    	# 上記で偽装モデル(:detail)に入れておいた(shipping_address_id)を引き出きだす。
			@order_detail.shipping_postal_code = @shipping_address.shipping_postal_code
			@order_detail.shipping_address = @shipping_address.shipping_address
			@order_detail.shipping_name = @shipping_address.shipping_name


		elsif params[:select_address] ==  "新しいお届け先"
			@shipping_address = ShippingAddress.new(shipping_address_params)
			@shirrong_address.customer_id = current_customer.id
			@shipping_address.save

			@shipping_address = ShippingAddress.new(shipping_address_params)
			@order_detail.shipping_postal_code = @shipping_address.postal_code
			@order_detail.shipping_address = @shipping_address.shipping_address
			@order_detail.shipping_name = @shipping_address.name



		end

		if @order_detail.save
			redirect_to check_customers_customer_order_detail_path(current_customer.id,@order_detail.id)
		else
			redirect_back(fallback_location: customers_customer_path(current_customer.id))
		end
	end

	private

	def order_detail_params
		params.require(:order_detail).permit(:shipping_postal_code,:shipping_name,:shipping_address,:shipping_fee,:subtotal,:total_fee,:payment_method)
	end
  def shipping_address_params
		params.require(:shipping_address).permit(:shipping_addresses_id, :shipping_postal_code, :shipping_address, :shipping_name)
	end

end


