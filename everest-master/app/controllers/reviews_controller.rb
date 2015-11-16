class ReviewsController < ApplicationController
  before_action :find_booking, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = @booking.reviews.build(params_review)

    if current_user.id == @booking.user_id
      @review.customer_review = true
    else
      @review.customer_review = false
    end

    if @review.save
      redirect_to gear_path(@booking.gear)
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:rating, :description)
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_customer_review
  end
end
