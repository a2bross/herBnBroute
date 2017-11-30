class RemoveIdsFromBooking < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :user_id, :integer
    remove_column :bookings, :plot_id, :integer
    remove_column :bookings, :review_id, :integer
  end
end
