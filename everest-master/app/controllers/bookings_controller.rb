class BookingsController < ApplicationController
  before_action :find_gear, only: [:create, :edit]
  before_action :find_booking, only:[:edit, :update]

  def create
    @booking = @gear.bookings.build(bookings_params)
    @booking.confirmed = false
    @booking.user_id = current_user.id
    if @booking.save
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.confirmed = true
    @booking.save
    @gear = @booking.gear_id
    redirect_to gear_path(@gear)
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :confirmed)
  end

  def find_gear
    @gear = Gear.find(params[:gear_id])
  end

  def find_booking
   @booking = Booking.find(params[:id])
  end
end
