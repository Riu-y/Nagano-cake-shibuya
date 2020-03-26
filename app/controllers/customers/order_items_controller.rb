class Customers::OrderItemsController < ApplicationController
	layout 'customers'

  def index
  	@order_details = current_customer.order_details
  	# @order_items = currento_customer.order_details
  	# @order_items = current_customer.order_items
    # @order_items = OrderItem.all(currento_cusutomer)
  end

	def show
    @order_item = OrderItem.find(params[:id])
  end
end