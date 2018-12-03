class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :profile, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
