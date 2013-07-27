class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # Authenticate is a Rails Helper method
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      redirect_to login_path, notice: "Email or password is invalid"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: "Logged out!"
  end
end