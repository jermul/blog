class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  	  session[:user_id] = user.id
  	  redirect_to root_url, notice: "Logged in"
  	else
  	  flash.now.alert = "Email or password is invalid"
  	  render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "Signed out"
  	redirect_to root_url
  end
end
