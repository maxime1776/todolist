# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  phone                  :string
#  last_name              :string
#  first_name             :string
#  picture                :string
#  token                  :string
#  token_expiry           :datetime
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_provider              (provider)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid                   (uid)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :friendships
  has_many :friends, through: :friendships

  has_and_belongs_to_many :meetings
  has_and_belongs_to_many :activities

  def self.random
    offset = rand(User.count)
    rand_record = User.offset(offset).first
  end

  def connect_with(user)
    if self != user
      Friendship.find_or_create_by user_id: self.id, friend_id: user.id
    end
  end

  def is_in(activity)
    self.activities.exists? activity
  end

  def self.populate_picture!
    all.each do |user|
      avatar = JSON.load(open('http://uifaces.com/api/v1/random'))['image_urls']['epic']
      user.picture = avatar
      user.save
      puts user.picture
    end
  end

  def populate_friends!
    graph = Koala::Facebook::API.new(self.token)
    user = graph.get_object("me")
    uids = graph.get_connections(user["id"], "friends").map do |user|
      user['id']
    end

    User.where(uid: uids).each do |user|
      self.connect_with user
    end
  end

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
end
