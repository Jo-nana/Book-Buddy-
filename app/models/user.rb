class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :chatrooms
  has_many :messages, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_many :owner_bookings, through: :books, source: :booking

  validates :first_name, :last_name, :tags, :address, presence: true
  validates :username, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def chats_owner
    self.books.bookings.chatrooms
  end
end
