class Customers::OrderItemsController < ApplicationController
	layout 'customers'

  def index
   	@order_details = current_customer.order_details
  end

	def show
    @order_detail = OrderDetail.find(params[:id])
    @order_item = @order_detail.order_items
  end
end