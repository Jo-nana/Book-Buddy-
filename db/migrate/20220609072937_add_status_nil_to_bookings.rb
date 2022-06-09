class AddStatusNilToBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :accepted, :boolean, default: false
    add_column :bookings, :accepted, :boolean
  end
end
