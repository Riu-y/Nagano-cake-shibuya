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
      redirect_back(fallback_location: customers_root_path)
  		#redirect_to customers_customer_shipping_addresses_path(@customer.id), notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
  		@shipping_addresses = ShippingAddress.all
      @customer = current_customer
  		render 'index'
  	end
end
def edit
    @shipping_address = ShippingAddress.find(params[:id])
    @customer = current_customer

end

def update
   shipping_address = ShippingAddress.find(params[:id])
   @customer = current_customer
   if shipping_address.update(shipping_address_params)
    redirect_to customers_customer_shipping_addresses_path
      #redirect_to customers_customer_shipping_addresses_path(@customer.id), notice: "successfully created book!"#保存された場合の移動先を指定。
    else
      @shipping_address = ShippingAddress.find(params[:id])
      @customer = current_customer
      render 'edit'
    end
end

def destroy
  @shipping_address = ShippingAddress.find(params[:id])
  @shipping_address.destroy
  redirect_to customers_customer_shipping_addresses_path
end

end

  private
  def shipping_address_params
      params.require(:shipping_address).permit(:shipping_addresses_id, :shipping_postal_code, :shipping_address, :shipping_name)
  end

