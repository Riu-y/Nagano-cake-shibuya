class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :customer_id
      t.string :shipping_name
      t.string :shipping_address
      t.integer :shipping_postal_code
      t.integer :subtotal
      t.integer :shipping_fee
      t.integer :total_fee
      t.integer :order_stauts, default: 0
      t.integer :payment_method

      t.timestamps
    end
  end
end