class UsersController < ApplicationController
  def new
    @user =  User.new
  end

  def show 
    if logged_in?
      @user= User.find(params[:id])
    else
      flash['alert']="Must be logged in to do that"
      redirect_to login_path
    end
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      session[:user_id]= @user.id 
      flash['success']="Account successfully created"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit 
    @user= User.find(session[:user_id])

  end

  def update
    @user= User.find(session[:user_id])
    if @user.update(user_params)
      flash['success']="Profile successfully updated"
      redirect_to user_path(@user)
    else 
      render :edit
    end
  end
private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
