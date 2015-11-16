class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings
  has_many :spots
  has_many :spot_reviews, through: :spots
  devise :omniauthable, omniauth_providers: [:facebook]
  after_create :send_welcome_email

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def booked_spot?(spot)
    has_spot = false

    self.bookings.each do |booking|
      booking.spot_id == spot.id ? has_spot = true : nil
    end

    return has_spot
  end

  def reviewed(spot)
    has_reviewed = false
    spot.spot_reviews.each do |review|
      review.user == self ? has_reviewed = true : nil
    end
    return has_reviewed
  end

  def imageUrl
    if self.picture.nil?
      ActionController::Base.helpers.asset_path('default_picture.png')
      #{ }"http://placehold.it/30x30"
      #{ }"/assets/default_photo.jpg"
    else
      self.picture
    end
  end

   private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
