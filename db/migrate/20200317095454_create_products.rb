class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :product_name
      t.string :product_image_id
      t.text :product_description
      t.integer :unit_price
      t.boolean :is_selling

      t.timestamps
    end
  end
end