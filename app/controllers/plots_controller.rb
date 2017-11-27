class PlotsController < ApplicationController

  # index et show sont temporaires
  def index
    @plots = Plot.all
  end
  #
  def show
    @plot = Plot.find(params[:id])
  end
  # end temp

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

  private

  def plot_params
    params.require(:plot).permit(:capacity, :name, :description, :location, :daily_price, :photo, :user_id)
  end

end
