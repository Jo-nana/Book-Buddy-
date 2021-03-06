class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :chatrooms

  validates :start_date, :end_date, presence: true
end
