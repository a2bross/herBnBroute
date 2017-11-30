class ChangeBooking < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :status, :string, default: "pending"
  end
end
