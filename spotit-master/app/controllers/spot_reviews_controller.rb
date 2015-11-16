class SpotReviewsController < ApplicationController

  before_action :set_spot, only: [:show, :edit, :update, :create]
  before_action :set_params, only: [:index, :new]
  before_filter :store_location
  before_action :authenticate_user!

  def index
    @all_reviews = SpotReview.all
    @spot_reviews = @all_reviews.where(spot_id: @spot.id)
  end

  def show
  end

  def new
    @spot_review = SpotReview.new
  end

  def create
    @spot_review = SpotReview.new(spot_review_params)

    if @spot_review.save
      redirect_to spot_path(@spot)
    else
      render spot_path(@spot)
    end
  end

  def edit
  end

  def update
    if @spot_review.update(spot_review_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def set_spot
    id = params[:spot_id] || params[:id]
    @spot = Spot.find(id)
  end
  def set_params
    @params = params
  end
  def spot_review_params
    params.require(:spot_review).permit(:rating, :comment, :user_id, :spot_id)
  end

end
