class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	 devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :validatable

	 has_many :shiping_address
	 has_many :order_details

	 validates :family_name, presence: true
	 validates :first_name, presence: true
	 validates :family_name_kana, presence: true
	 validates :first_name_kana, presence: true
	 validates :postal_code, presence: true
	 validates :address, presence: true
	 validates :telephone_number, presence: true
	 validates :email, presence: true

	def full_address
		self.full_address = postal_code + address + family_name + first_name
	end

	def active_for_authentication?
    	super && (self.is_acctive == true)
  	end

end
