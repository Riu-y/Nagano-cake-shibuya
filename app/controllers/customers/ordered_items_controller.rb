class Customers::OrderedItemsController < ApplicationController
	layout 'customers'


	def index
		@customer = Customer.find(params[:customer_id])
		@order_details = OrderDetail.all
	end

	def show
        @customer = Customer.find(params[:customer_id])
        @order_details = OrderDetail.find(params[:id])

	end

end
