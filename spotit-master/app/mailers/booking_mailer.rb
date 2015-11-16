class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_confirmation.subject
  #
  def booking_confirmation(spot, booking)
    @spot = spot
    @booking = booking

   mail(to: @spot.user.email, subject: 'Your have a new booking')
  end
end
