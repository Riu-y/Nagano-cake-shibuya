class AddDefaltShippingFeeToOrderDetail < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_details, :shipping_fee, :integer, :default => 800
  end
end
