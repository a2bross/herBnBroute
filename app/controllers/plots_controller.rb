class PlotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_plot, only: [:show, :edit, :update, :destroy]

  def index
    @nearby_plots = Plot.near(params[:location], 10)
    if params[:location] && @nearby_plots.first
      @plots = @nearby_plots
    else
      @plots = Plot.where.not(latitude: nil, longitude: nil)
    end
    @markers = @plots.map do |plot|
      {
        lat: plot.latitude,
        lng: plot.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @plot = Plot.new
    authorize @plot
  end

  def create
    @plot = Plot.new(plot_params)
    @plot.user = current_user
    authorize @plot
    if @plot.save
      redirect_to plot_path(@plot)
    else
      raise
    end
  end

  def edit
  end

  def update
    if @plot.update(plot_params)
      redirect_to plot_path(@plot)
    else
      raise
    end
  end

  def destroy
    @user = @plot.user
    @plot.destroy
    redirect_to user_path(@user)
  end

  private

  def plot_params
    params.require(:plot).permit(:capacity, :name, :description, :location, :daily_price, :photo, :user_id)
  end

  def set_plot
    @plot = Plot.find(params[:id])
    authorize @plot
  end
end
