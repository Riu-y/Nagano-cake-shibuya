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
		@order_detail = OrderDetail.find_by(id: @order_item.order_detail_id)
		@order_item.update(order_item_params)

		#@order_itemsの制作ステータスのカラムで配列を作り、その中から制作済み(done)を削除
		#配列の中身が空であれば全て商品の制作ステータスが制作済みということになるのでそのタイミングで注文ステータスを配送準備中に切り替える
		@order_items = @order_detail.order_items.map{ |h| h[:creation_status] }
		@order_items.delete("done")

		if @order_item.creation_status == "cannot"
			@order_detail.order_stauts = 1
		elsif @order_item.creation_status == "weit"
			@order_detail.order_stauts = 1
		elsif @order_item.creation_status == "doing"
			@order_detail.order_stauts = 2
		elsif @order_item.creation_status == "done"
			if @order_items.length == 0
				@order_detail.order_stauts = 3
			end
		end

		@order_detail.update(order_detail_params)
		redirect_back(fallback_location: admins_root_path)
 	end

 	private

 	def order_item_params
		params.require(:order_item).permit(:creation_status)
	end

	def order_detail_params
		params.permit(:order_stauts)
	end
end
