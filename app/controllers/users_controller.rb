class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully Created User'    
    else  
      redirect_to users_path, alert: 'Email or password invalid' 
      #render :new
    end    
  end

  def show
    @user = User.includes(:stories).find(helpers.current_user.id)
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end  
end
