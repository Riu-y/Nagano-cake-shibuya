class Customers::CustomersController < ApplicationController
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
	 @customer.update(customer_params)
	 redirect_to edit_customers_customer_path(@customer.id)
# 更新できた場合とできない場合で条件式をわける
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

