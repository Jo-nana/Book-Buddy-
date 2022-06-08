class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :chatrooms, dependent: :destroy

  validates :start_date, :end_date, presence: true
end
