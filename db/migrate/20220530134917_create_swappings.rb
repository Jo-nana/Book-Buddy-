class CreateSwappings < ActiveRecord::Migration[6.1]
  def change
    create_table :swappings do |t|
      t.bigint :booking_swappie
      t.bigint :booking_swapper

      t.timestamps
    end
  end
end
