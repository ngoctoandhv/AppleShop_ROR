class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
	serialize :image, JSON # If you use SQLite, add this line.
	belongs_to :user, optional: true

	validates :title, :price, :model, presence: true
	validates :description, length: { maximum: 1000, too_long: "%{count} characters is 	the maximum aloud. "}
	validates :title, length: { maximum: 140, too_long: "%{count} characters is the 	maximum aloud. "}
	validates :price, length: { maximum: 7 }

	MODEL = %w{ MacBook Iphone AppleWatch Ipad }
	COLOR = %w{ Black White Navy Blue Red Clear Satin Yellow }
	CONDITION = %w{ New Used }

end
