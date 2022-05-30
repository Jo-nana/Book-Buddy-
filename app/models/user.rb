class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, :tags, presence: true
  validates :username, presence: true, uniqueness: true
end
