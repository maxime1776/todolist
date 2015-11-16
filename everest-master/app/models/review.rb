class Review < ActiveRecord::Base
  RATING = [0, 1 ,2 ,3 ,4 ,5]

  belongs_to :booking
  validates :booking, presence: true
  validates :rating, presence: true, inclusion: { in: RATING }
  validates :description, presence: true, length: { in: 5...3000 }
  validates :customer_review, inclusion: { in: [true, false] }
end
