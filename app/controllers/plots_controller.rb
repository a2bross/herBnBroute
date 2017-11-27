class PlotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

def index
  @plots = Plot.all
end

def show
  @plot = Plot.find(params[:id])
  @plot = Plot.new
end

end
