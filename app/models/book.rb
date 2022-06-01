class Book < ApplicationRecord
  belongs_to :user
  has_many :chatroom, dependent: :destroy

  validates :title, :author, :tags, :picture, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 500, too_long: "%<count> characters is the maximum allowed" }

  # PG SEARCH
  include PgSearch::Model
  pg_search_scope :search_by_title_and_author,
    against: [ :title, :author ],
    using: {
      tsearch: { prefix: true }
    }
end
