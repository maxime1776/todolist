class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:user_signed_in_and_not_on_it, :show]
  def index
    @activities = Activity.all
  end

  def show
    @friends = current_user.friends.select {|user| user.is_in @activity}
    if user_signed_in_and_not_on_activity
      @activity.add_user current_user
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def user_signed_in_and_not_on_activity
    user_signed_in? && !current_user.activities.exists?(id: @activity.id)
  end
end
