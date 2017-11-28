class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      raise
    end
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@plot)
    else
      raise
    end
  end

  def destroy
    plot_id = @booking.plot_id
    @booking.destroy
    redirect_to plot_path(plot_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :plot:id, :start_date, :end_date, :full_price, :review_id, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
