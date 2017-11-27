class CreatePlots < ActiveRecord::Migration[5.1]
  def change
    create_table :plots do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :capacity
      t.integer :daily_price
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
