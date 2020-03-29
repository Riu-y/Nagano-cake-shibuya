class Customers::OrderItemsController < ApplicationController
	layout 'customers'
	before_action :authenticate_customer!

  def index
   	@order_details = current_customer.order_details.order("id DESC").page(params[:page]).per(5)
  end

	def show
    @order_detail = OrderDetail.find(params[:id])
    @order_item = @order_detail.order_items
  end
end