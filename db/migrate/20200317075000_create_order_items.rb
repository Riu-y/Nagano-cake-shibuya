class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

    	t.integer :order_details_id, null: false
    	t.integer :product_id, null: false
    	t.integer :number, null: false
    	t.integer :creation_status, null: false, default: 0
    	t.integer :purchase_price, null: false

      t.timestamps
    end
  end
end
