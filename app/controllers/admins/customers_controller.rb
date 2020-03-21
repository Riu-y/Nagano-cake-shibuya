class Admins::CustomersController < ApplicationController
	layout 'admins'
	def index
		@customers = Customer.all
	end

	def show
		
	end

	def edit
		
	end

	def update
		
	end
end
