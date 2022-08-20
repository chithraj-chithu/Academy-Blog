# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    current_user
    @updates = Update.all
    @user = User.all
    @count = 1
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
      
    end
    puts @presence
    render 'home/index'
  end

  def update_new
    current_user
    update = Update.new(updates: params[:updates], user_id: current_user.id)
    if update.save
      render plain: 'Success'
    else
      render plain: 'False'
    end
  end
end
