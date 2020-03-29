class Customers::OrderDetailsController < ApplicationController
	layout 'customers'

	def new
		@customer = Customer.find(params[:customer_id])
		if @customer.carts.blank?
 			flash[:blank] = "カートの中身がありません"
			redirect_to customers_customer_carts_path(current_customer.id)
		else
			@order_detail = OrderDetail.new
		end
	end

	def index
		@carts = current_customer.carts
		@customer = current_customer
		@order_detail = OrderDetail.new(order_detail_params)

		if  params[:select_address] == "ご自身の住所"
			@order_detail.shipping_postal_code = current_customer.postal_code
      @order_detail.shipping_address = current_customer.address
      @order_detail.shipping_name = current_customer.family_name + current_customer.first_name

    elsif params[:select_address] == "登録済み住所から選択"
    	@shipping_address = ShippingAddress.find(params[:detail][:shipping_address_id])
    # 上記の偽装モデル(:detail)に(shipping_address_id)を格納する。後ほどコントローラで呼び出す。
			@order_detail.shipping_postal_code = @shipping_address.shipping_postal_code
			@order_detail.shipping_address = @shipping_address.shipping_address
			@order_detail.shipping_name = @shipping_address.shipping_name

		elsif params[:select_address] ==  "新しいお届け先"
			@shipping_address = ShippingAddress.new(shipping_address_params)
		#新しいお届け先を登録するためにnewする
			@shipping_address.customer_id = current_customer.id
			@shipping_address.save
			@order_detail.shipping_postal_code = @shipping_address.shipping_postal_code
			@order_detail.shipping_address = @shipping_address.shipping_address
			@order_detail.shipping_name = @shipping_address.shipping_name
		end
	end

	def create
		@order_detail = OrderDetail.new(order_detail_params)
		@customer = current_customer
		@order_detail.customer_id = current_customer.id
		@carts = current_customer.carts
	#商品金額の計算
		array = []
			@carts.each do |cart|
				array << cart.product.unit_price * cart.number
			end
		@order_detail.subtotal = array.sum
		@order_detail.total_fee = @order_detail.subtotal + @order_detail.shipping_fee
		if @order_detail.save
	#カートの中身をOrderItemテーブルにeachで格納
			current_customer.carts.each do |cart|
				order_item = OrderItem.new(order_detail_id: @order_detail.id, product_id: cart.product_id, number:cart.number, purchase_price: cart.number * cart.product.unit_price)
				order_item.save
			end
			current_customer.carts.destroy_all
			redirect_to complete_customers_customer_order_detail_path(current_customer.id,@order_detail.id)
		else
	#注文情報（orderdetail）にvalidatesをかけてあるので未入力の場合、ここでredirectを実行
			flash[:information_check] = "未入力の情報があります"
			redirect_to new_customers_customer_order_detail_path(current_customer.id,@order_detail.id)
		end
	end


	def update
		@order_detail = OrderDetail.find(params[:id])
		@order_items = @order_detail.order_items
		@order_detail.update(order_detail_params)

		if @order_detail.order_status == "wait_deposit"
			@order_items.update_all(creation_status: 0)
		elsif @order_detail.order_status == "payment_confirmation"
			@order_items.update_all(creation_status: 1)
		elsif @order_detail.order_status == "inproduction"
			@order_items.update_all(creation_status: 2)
		elsif @order_detail.order_status == "preparing_for_shipment"
			@order_items.update_all(creation_status: 3)
		elsif @order_detail.order_status == "sent"
			@order_items.update_all(creation_status: 3)
		end

		redirect_back(fallback_location: admins_root_path)
	end

	def complete
	end

private
	def order_detail_params
		params.require(:order_detail).permit(:shipping_postal_code,:shipping_name,:shipping_address,:shipping_fee,:subtotal,:total_fee,:payment_method,:order_status)
	end

	def shipping_address_params
		params.require(:shipping_address).permit(:shipping_address_id, :shipping_postal_code, :shipping_address, :shipping_name)
	end

	def order_item_params
		params.require(:order_item).permit(:product_id,:number,:purchase_price)
	end
end
