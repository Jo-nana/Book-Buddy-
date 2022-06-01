class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :name, presence: true, uniqueness: true
end
