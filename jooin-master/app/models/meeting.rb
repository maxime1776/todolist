# == Schema Information
#
# Table name: meetings
#
#  id          :integer          not null, primary key
#  leader_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :integer
#

class Meeting < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :activity
end
