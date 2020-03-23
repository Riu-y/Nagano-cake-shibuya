class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :shiping_address
 has_many :order_details

	def full_address
		self.full_address = postal_code + address + family_name + first_name
	end
end
