class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :address_street
      t.string :address_city
      t.string :adress_zipcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
