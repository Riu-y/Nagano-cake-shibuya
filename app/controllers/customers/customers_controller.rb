class Customers::CustomersController < ApplicationController
	before_action :authenticate_customer!
	layout 'customers'
	def show
	 @customer =Customer.find(params[:id])
	end

	def delete
	 @customer = Customer.find(params[:id])
	end

	def edit
	 @customer = Customer.find(params[:id])
	end

	def update
	 @customer = Customer.find(params[:id])
	 if @customer.update(customer_params)
	 	redirect_to customers_customer_path(@customer.id)
	 else
		render :edit
	 end
	end

	def active_false
		@customer = Customer.find(params[:id])
		@customer.is_acctive = false
		@customer.save
		puts @customer.is_acctive
		redirect_to edit_customers_customer_path(@customer.id)
	end



	private
	def customer_params
	    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
	end
	end

