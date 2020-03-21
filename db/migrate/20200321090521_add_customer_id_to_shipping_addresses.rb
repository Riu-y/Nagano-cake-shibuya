class AddCustomerIdToShippingAddresses < ActiveRecord::Migration[5.2]
  def change
  	add_column :shipping_addresses, :customer_id, :integer
  end
end
