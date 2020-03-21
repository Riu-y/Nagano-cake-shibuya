class AddColumsToCustomers < ActiveRecord::Migration[5.2]
  def change
  	add_column :customers, :customer_id, :integer
    add_column :customers, :family_name, :string
    add_column :customers, :first_name, :string
    add_column :customers, :family_name_kana, :string
    add_column :customers, :first_name_kana, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :string
    add_column :customers, :telephone_number, :string
    add_column :customers, :is_acctive, :boolean, default: true
  end
end