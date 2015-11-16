class GearsController < ApplicationController
  before_action :find_gear, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @gears = Gear.all
    if params[:city]
      @gears = Gear.where(city: params[:city])
    end
  end

  def show
    @bookings = @gear.bookings
    @unconfirmed_bookings = Booking.where(gear_id: @gear.id, confirmed: false)
    @booking = Booking.new
    @owner = User.find(@gear.user_id)
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(params_gears)
    @gear.user = current_user
    if @gear.save
      redirect_to gear_path(@gear)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @gear.title = params_gears[:title]
    @gear.sport = params_gears[:sport]
    @gear.brand = params_gears[:brand]
    @gear.description = params_gears[:description]
    @gear.price = params_gears[:price]
    @gear.address = params_gears[:address]
    @gear.city = params_gears[:city]
    @gear.zipcode = params_gears[:zipcode]
    @gear.picture = params_gears[:picture]

    @gear.save
    redirect_to gears_path
  end

  def destroy
    if @gear.delete
      redirect_to gears_path
    else
      redirect_to gear_path(gear)
    end
  end

  private

  def find_gear
    @gear = Gear.find(params[:id])
  end

  def params_gears
    params.require(:gear).permit(:title, :picture, :sport, :brand, :description, :price, :address, :city, :zipcode )
  end

end
