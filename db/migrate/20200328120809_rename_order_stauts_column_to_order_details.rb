class RenameOrderStautsColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
  	rename_column :order_details, :order_stauts, :order_status
  end
end
