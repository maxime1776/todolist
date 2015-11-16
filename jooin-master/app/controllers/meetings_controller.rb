class MeetingsController < ApplicationController
  def create
    meeting = Meeting.new
    meeting.activity = Activity.find(params[:activity_id])
    meeting.users << current_user
    params[:users].each do |id|
      if id.last == "true"
        meeting.users << User.find(id.first)
      end
    end
    if meeting.save
      redirect_to :back
    end
  end
end
