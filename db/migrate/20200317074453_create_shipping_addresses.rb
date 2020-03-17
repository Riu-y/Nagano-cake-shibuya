class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|

    	t.integer :shipping_addresses_id,null: false
    	t.string :shipping_postal_code,null: false
    	t.string :shipping_address,null: false
    	t.string :shipping_name,null: false

      t.timestamps
    end
  end
end
