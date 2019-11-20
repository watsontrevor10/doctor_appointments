class UsersController < ApplicationController
  # before_action :set_user
  def index
    @users = current_user.appointments.all 
  end

  def new
    # @user = User.new
  end

  def create

  end

  def show
  end

  def edit

  end

  def destroy
  end

end
