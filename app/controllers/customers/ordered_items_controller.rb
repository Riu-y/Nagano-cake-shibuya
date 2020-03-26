class Customers::OrderedItemsController < ApplicationController
	layout 'customers'

  def index
    @order_items = current_customer.order_items.order_item("created_at DESC")
    @order_items = OrderItem.all(currento_cusutomer)
  end

	def show
    @order_item = OrderItem.find(params[:id])
  end
end