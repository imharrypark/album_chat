class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: user_params[:name])

    if @user && @user.authenticate(user_params[:password])
      session[:id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid username and/or password"
      @user = User.new
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end
end
