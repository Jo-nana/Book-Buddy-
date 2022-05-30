class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, :chatrooms, :messages, :bookings, dependent: :destroy
  validates :first_name, :last_name, :tags, presence: true
  validates :username, presence: true, uniqueness: true
end
