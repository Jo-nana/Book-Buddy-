class Book < ApplicationRecord
  belongs_to :user
  has_many :chatroom, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, :author, :tags, :picture, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 500, too_long: "%<count> characters is the maximum allowed" }

  def change_availability_to_false
    # code to change availiability of computer
    self.update(availability: false)
  end

  # PG SEARCH
  include PgSearch::Model
  pg_search_scope :search_by_title_and_author,
    against: [ :title, :author ],
    using: {
      tsearch: { prefix: true }
    }
end
