# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new; end

  def index
    @user = User.all
  end

  def create
    user = User.new(user_params)
    user.profile_picture.attach(user_params[:profile_picture])
    if user.save
      redirect_to '/signin'
    else
      flash[:error] = user.errors.full_messages.first
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :profile_picture)
  end
end
