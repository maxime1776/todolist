class BookingsController < ApplicationController
  before_action :set_spot, only: [:new, :create,:show, :edit, :update]
  before_action :set_booking, only: [:show, :edit, :update, :delete]
  before_action :set_params, only: [:index, :new]
  before_filter :store_location
  before_action :authenticate_user!



  def show

  end

  def new
    @booking = Booking.new()
  end

  def create

    @params = booking_params
    @booking = Booking.new(booking_params)
    @booking.spot = @spot
    # @booking.total_price = @spot.price *(@booking.start_time-@booking.end_time)
    if @booking.save
      BookingMailer.booking_confirmation(@spot,@booking).deliver_now
      redirect_to user_path(current_user)
    else
      render :new
    end
  end


  def edit
  end

  def update
    @booking.update(params[:id])
  end

  def delete
    @booking.delete
  end

  private
  def set_spot
    id = params[:spot_id]
    @spot = Spot.find(id)
  end

  def set_params
    @params = params
  end
  def set_booking
    id = params[:id]
    @booking = @spot.booking.find(id)
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :spot_id, :user_id, :total_price)
  end

end

