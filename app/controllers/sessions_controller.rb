class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new;end

  def create 
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id 
          redirect_to user 
      else 
          flash[:error] = "Email and Password combination is incorrect"
          redirect_to new_login_path
      end
  end 

  def destroy
    session.delete(:user_id)
    redirect_to home_path
  end

end
