class AddColumnToCarts < ActiveRecord::Migration[5.2]
  def change
  	add_column :carts, :cart_id, :integer
  end
end
