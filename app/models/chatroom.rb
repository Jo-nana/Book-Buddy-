class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :messages, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
