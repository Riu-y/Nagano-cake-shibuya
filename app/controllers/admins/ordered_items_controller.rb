class Admins::OrderedItemsController < ApplicationController
	layout 'admins'
	def index
		@order_details = OrderDetail.all
	end
	def show
		
	end
	def update
		
	end
end
