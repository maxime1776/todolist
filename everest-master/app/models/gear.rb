class Gear < ActiveRecord::Base
  SPORTS = ["Kitesurf", "Surf", "Bodyboard", "Paddle",
            "Kayak", "Planche à voile", "Ski", "Raquette", "Camping", "Trekking"]
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :sport, presence: true, inclusion: { in: SPORTS, message: "%{value} is not a valid sports"  }
  validates :description, presence: true, length: { in: 30..5000 } # Remi : I set the minimum to 30 so easier for tests
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 10000, message: "%{value} is not a valid price" }
  validates :address, presence: true, length: { in: 3..500 }
  validates :city, presence: true, length: { in: 2..30 }
  validates :zipcode, presence: true, format: { with: /\A\d{5}\z/,
    message: "unvalid zipcode format" }

  has_attached_file :picture,
    styles: { large: "1400x1400>", medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def user
    @user = User.find(self.user_id)
  end

  # def full_address
  #   :address + " " + :zipcode + " " + :city
  # end

end
