class Admins::OrderItemsController < ApplicationController
		layout 'admins'
	def index
		@order_details = OrderDetail.all
	end
	def show
		@order_detail = OrderDetail.find(params[:id])
		@order_items = @order_detail.order_items

	end

	def update
		@order_item = OrderItem.find(params[:id])
		#binding.pry
		@order_item.update(order_item_params)
		#binding.pry
		redirect_back(fallback_location: admins_root_path)
 	end

 	private

 	def order_item_params
		params.require(:order_item).permit(:creation_status)
	end

end
