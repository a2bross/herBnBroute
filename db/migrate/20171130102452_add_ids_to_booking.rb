class AddIdsToBooking < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :plot, foreign_key: true
  end
end
