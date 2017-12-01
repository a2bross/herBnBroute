class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    authorize @review
    @user = current_user
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
