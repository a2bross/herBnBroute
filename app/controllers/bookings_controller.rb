class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :accept, :decline]
  before_action :set_plot, only: [:new, :create]

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
    @booking.plot_id = @plot.id
    @booking.user_id = current_user.id
    if params[:booking][:end_date].present? && params[:booking][:start_date].present?
      duration = Date.parse(params[:booking][:end_date]) - Date.parse(params[:booking][:start_date]) + 1
      @booking.full_price = @plot.daily_price * duration.to_i
    end
    if @booking.save
      # @booking.status = :pending
      redirect_to user_path(current_user)
    else
      render "plots/show"
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
      render :edit
    end
  end

  def destroy
    @plot = @booking.plot
    @booking.destroy
    redirect_to plot_path(@plot)
  end

  def accept
    @booking.status = "accepted"
    @booking.save
    redirect_to user_path(current_user, tab: "requests-list")
  end

  def decline
    @booking.status = "declined"
    @booking.save
    redirect_to user_path(current_user, tab: "requests-list")
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :plot_id, :start_date, :end_date, :full_price, :review_id, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_plot
    @plot = Plot.find(params[:plot_id])
  end
end
