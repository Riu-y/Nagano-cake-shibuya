class Customers::ShippingAddressesController < ApplicationController
layout 'customers'

def index
	@shipping_addresses = ShippingAddress.all
	@shipping_address = ShippingAddress.new
	@customer = current_customer
end

def new
end

def create
	@shipping_address = ShippingAddress.new(shipping_address_params)
  @shipping_address.customer_id = current_customer.id
  	if @shipping_address.save #入力されたデータをdbに保存する。
  		redirect_to customers_customer_shipping_addresses_path(@customer), notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
  		@shipping_addresses = ShippingAddress.all
  		render 'index'
  	end
end
def edit
    @customer = Customer.find(params[:id])
end

def update
   @customer = Customer.find(params[:id])
   @customer.update(customer_params)
   redirect_to edit_customers_customer_path(@customer.id)
  end

end

  private
  def shipping_address_params
      params.require(:shipping_address).permit(:shipping_addresses_id, :shipping_postal_code, :shipping_address, :shipping_name)
  end
end
