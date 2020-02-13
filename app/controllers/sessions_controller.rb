class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(email: params[:user][:email], password: params[:user][:password] )
    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Sign in successfully'
    else    
      render action: :new, alert: 'Email or password not valid' 
    end  
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out successfully'
  end
end
