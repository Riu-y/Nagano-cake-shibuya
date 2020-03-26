class Customers::OrderItemsController < ApplicationController
	layout 'customers'
   # before_action :baria_customer, only: [:index,:show]

  def index
   	@order_details = current_customer.order_details
  end

	def show
    @order_detail = OrderDetail.find(params[:id])
    @order_item = @order_detail.order_items

  end

  # def baria_customer
  #   unless params[:id].to_i == current_customer.id
  #   redirect_to products_path(current_customer)
  #   end
  # end
end