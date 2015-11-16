module GearsHelper
  def rating_average(gear)
      bookings = gear.bookings
      rating_sum = 0
      rating_count = 0
      bookings.each do |booking|
        booking.reviews.each do |review|
          if review.customer_review
            rating_sum += review.rating
            rating_count += 1
          end
        end
      end
    rating_count = rating_count.to_f
    rating_sum = rating_sum.to_f
    rating_average = rating_sum / rating_count
    rating_average.round(1)
  end
end
