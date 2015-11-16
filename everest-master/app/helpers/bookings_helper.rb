module BookingsHelper
  def check_if_reviewable(booking)
    booking.user == current_user && booking.confirmed == true && DateTime.now > booking.end_date
  end
end
