# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  name       :string
#  icon       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Activity < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :meetings

  def add_user(user)
    self.users << user
  end

  def self.populate!
    all.each do |activity|
      Random.rand(10).times do
        user = User.random
        activity.add_user user
        puts "#{user.first_name} in #{activity.name}"
      end
    end
  end
end
