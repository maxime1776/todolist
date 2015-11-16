class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :gear
  has_many :reviews
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :confirmed, inclusion: { in: [ true, false ] }
end
