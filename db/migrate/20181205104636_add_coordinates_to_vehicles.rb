class AddCoordinatesToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :latitude, :float
    add_column :vehicles, :longitude, :float
  end
end
