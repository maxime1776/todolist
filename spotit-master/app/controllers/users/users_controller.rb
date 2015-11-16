class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]


  def show

  end

  def edit
  end

  def update
  end


private
  def set_user
    id = params[:user_id] || params[:uid]
    @user = User.find_by_uid(id)
  end


end
