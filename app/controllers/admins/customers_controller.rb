class Admins::CustomersController < ApplicationController
	layout 'admins'
	def index
		@customers = Customer.all.page(params[:page]).per(5)
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			redirect_to admins_customer_path(@customer.id)
		else
			render action: :edit
		end
	end
	private
	def customer_params
	    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_acctive)
	end
end
