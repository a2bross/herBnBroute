class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :plot_id
      t.date :start_date
      t.date :end_date
      t.integer :full_price
      t.integer :review_id
      t.string :status

      t.timestamps
    end
  end
end
