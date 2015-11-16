class Booking < ActiveRecord::Base
  alias_attribute :user, :renter
  belongs_to :spot
  belongs_to :user


  def owner
    spot.user
  end

  validates :total_price, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  private


end
