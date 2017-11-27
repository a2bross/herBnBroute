class PlotsController < ApplicationController
  def new
    @plot = Plot.new
  end

  def create
    @plot = Plot.new(plot_params)
    @plot.save

    redirect_to 'plots#show'
  end

  private

  def plot_params
    params.require(:plot).permit(:capacity, :name, :description, :location, :daily_price, :photo, :user)
  end

end
