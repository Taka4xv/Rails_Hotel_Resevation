class SessionsController < ApplicationController
  before_action :login_check, {only: [:destroy]}
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(password: params[:encrypted_password])
      session[:user_id] = user.id
      redirect_to controller: :homes, action: :main, notice: "you have successfully login"
    else
      flash.now[:alert] = "Email or Password is invalid"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "you have successfully logout"
  end
end
