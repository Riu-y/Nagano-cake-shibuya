class AddColumnToShippingAddresses < ActiveRecord::Migration[5.2]
  def change
  	add_column :shipping_addresses, :shipping_address_id, :integer
  end
end
