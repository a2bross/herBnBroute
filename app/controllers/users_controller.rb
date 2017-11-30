class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @user.bookings.each do |booking|
      # check the proper Date object
      if (booking.status == "accepted") && (booking.end_date < Date::today)
        booking.status = "completed"
        booking.save
      end
    end
  end
end

# fix for agathe
