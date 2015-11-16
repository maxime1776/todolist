# send_text_message {
#   recipient_phone_number: "06[...]",
#   activity_name: 'Expo',
#   sender_first_name: 'Thomas',
#   sender_phone_number: '06[...]'
# }

module ApplicationHelper
  def color
    array = [
      "emerland",
      "amethyst",
      "pete-river",
      "turquoise",
      "pumkin",
      "wet-alphast",
      "sun-flower",
      "carott",
      "alzarin"
    ].sample
  end

  def send_text_message(data)
    twilio_sid = ENV['TWILLIO_SID']
    twilio_token =  ENV['TWILLIO_TOKEN']

    client = Twilio::REST::Client.new twilio_sid, twilio_token

    client.account.messages.create(
      :from => ENV['TWILLIO_PHONE'],
      :to => data[:recipient_phone_number],
      :body => "#{data[:activity_name]} avec #{data[:sender_first_name]}? Son numéro: #{data[:sender_phone_number]}"
    )
  end
end
