class Genre < ApplicationRecord
	has_many :products, dependent: :destroy

	validates :genre_name, presence: true
	validates :flag_active, presence: true
end