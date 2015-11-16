class PagesController < ApplicationController
  def home
    @spot = Spot.new
    @spots = Spot.all
  end
  def add
  end
end
