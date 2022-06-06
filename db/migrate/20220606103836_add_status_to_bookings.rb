class AddStatusToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :accepted, :boolean, default: false
  end
end
