class TwilioController < ApplicationController
  include ApplicationHelper
  def message
    if Rails.env.development?
      sleep 2
      render json: { delivered: true }
    else
      recipient = User.find(params[:recipient_id])
      sender = current_user
      activity = Activity.find(params[:activity_id])
      send_text_message({
        recipient_phone_number: recipient.phone,
        activity_name: activity.name,
        sender_first_name: sender.first_name,
        sender_phone_number: sender.phone
      })

      render json: { delivered: true }
    end
  end
end
