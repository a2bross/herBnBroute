class PlotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_plot, only: [:show, :edit, :update, :destroy]

  def index
    @plots = Plot.all
  end

  def show
  end

  def new
    @plot = Plot.new
  end

  def create
    @plot = Plot.new(plot_params)
    @plot.user = current_user
    if @plot.save
      redirect_to plot_path(@plot)
    else
      raise
    end
  end

  def edit
  end

  def update
    @plot = Plot.new(plot_params)
    if @plot.save
      redirect_to plot_path(@plot)
    else
      raise
    end
  end

  def destroy
    @plot.destroy
  end

  private

  def plot_params
    params.require(:plot).permit(:capacity, :name, :description, :location, :daily_price, :photo, :user_id)
  end

  def set_plot
    @plot = Plot.find(params[:id])
  end
end
