class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    authorize @review
    if @review.save
      redirect_to user_path(current_user)
    else
      render 'users/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking)
  end
end
