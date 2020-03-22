class Customers::OrderDetailsController < ApplicationController
	layout 'customers'

	def new
		@order_detail = Orderdetail.new
		@customer = Costomer.find(params[:id])
	end

	def check
	end

	def create
	end

	def complete
	end

	private
	def order_detail_params
		params(:order_detail).permit(:shipping_postal_code,:shipping_name,:shipping_address,:shipping_fee,:subtotal,:total_fee,:payment_method)
	end
end
