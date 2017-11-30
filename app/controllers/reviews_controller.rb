class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @user = Booking.find(params[:booking_id]).user
    authorize @review
    if @review.save
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking)
  end
end
