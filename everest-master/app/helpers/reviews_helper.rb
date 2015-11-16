module ReviewsHelper
  def has_review(bookings, current_user)
    count_from_user = 0
    bookings.each do |booking|
      r = booking.reviews
      r.each do |review|
        if review.booking.user_id == current_user.id
        count_from_user += 1
        end
      end
    end
    count_from_user
  end
end
