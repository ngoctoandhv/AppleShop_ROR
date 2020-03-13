class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
	serialize :image, JSON # If you use SQLite, add this line.
	belongs_to :user, optional: true
	has_many :line_items, dependent: :destroy
	before_destroy :check_if_has_line_item

	validates :title, :price, :model, presence: true
	validates :description, length: { maximum: 1000, too_long: "%{count} characters is 	the maximum aloud. "}
	validates :title, length: { maximum: 140, too_long: "%{count} characters is the 	maximum aloud. "}
	validates :price, length: { maximum: 7 }

	MODEL = %w{ MacBook Iphone AppleWatch Ipad }
	COLOR = %w{ Black White Navy Blue Red Clear Satin Yellow }
	CONDITION = %w{ New Used }

	def check_if_has_line_item
		unless line_items.empty?
			errors.add(:base, 'This product has a LineItem')
			throw :abort
		end
	end
		

end
