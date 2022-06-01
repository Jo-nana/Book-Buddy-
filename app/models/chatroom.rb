class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :messages
  validates :name, presence: true, uniqueness: true
end
