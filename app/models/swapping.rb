class Swapping < ApplicationRecord
  has_many :booking_swappie, class_name: 'User', foreign_key: 'swappie_id'
  has_many :booking_swapper, class_name: 'User', foreign_key: 'swapper_id'
end
