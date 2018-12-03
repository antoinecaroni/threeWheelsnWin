class RenameColumnFromProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :adress_zipcode, :address_zipcode
  end
end
