class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_plot, only: [:new, :create, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.plot = @plot
    @booking.user = current_user
    duration = params[:end_date] - params[:start_date]
    @booking.full_price = @plot.daily_price * duration
    if @booking.save
      @booking.status = "booked"
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
    @booking.destroy
    redirect_to plot_path(@plot)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :plot:id, :start_date, :end_date, :full_price, :review_id, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_plot
    @plot = Plot.find(params[:plot_id])
  end
end
