class RemoveShippingAddressesIdFromShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :shipping_addresses, :shipping_addresses_id, :integer
  end
end
