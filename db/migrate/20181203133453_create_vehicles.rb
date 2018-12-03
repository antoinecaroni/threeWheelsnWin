class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.references :type, foreign_key: true
      t.string :photo
      t.integer :price
      t.text :description
      t.references :profile, foreign_key: true
      t.integer :seats
      t.string :address_street
      t.string :address_city
      t.string :address_zipcode

      t.timestamps
    end
  end
end
