class AddCoordinatesToPlots < ActiveRecord::Migration[5.1]
  def change
    add_column :plots, :latitude, :float
    add_column :plots, :longitude, :float
  end
end
