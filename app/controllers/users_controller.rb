class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end
end
