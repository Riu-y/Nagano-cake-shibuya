class Admins::OrderedItemsController < ApplicationController
	layout 'admins'
	def index
	  @ordered_items = OrderedItem.all
	end
	def show
		
	end
	def update
		
	end
end
