class ReviewsController < ApplicationController
  before_action :set_booking, only: :create

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    @bookings = current_user.profile.bookings
    if @review.save
      redirect_to dashboards_mybookings_path
    else
      render 'dashboards/mybookings'
    end
  end

  private
  # Private Methods below

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    # You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:review).permit(:content, :rating)
  end
end
