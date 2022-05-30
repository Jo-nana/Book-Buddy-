class Book < ApplicationRecord
  belongs_to :user
  validates :title, :author, :tags, :picture, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 150, too_long: "%<count> characters is the maximum allowed" }
end
