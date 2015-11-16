class SpotReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot

  validates :comment, presence: true
  validates :rating, presence: true

end
