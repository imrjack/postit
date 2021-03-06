class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit,:update]

  def new
    @user =  User.new
  end

  def show 
    @user=User.find(params[:id])
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
  end

  def update
    if @user.update(user_params)
      flash['success']="Profile successfully updated"
      redirect_to user_path(@user)
    else 
      render :edit
    end
  end
private

  def set_user 
    @user=User.find(session[:user_id])
  end

  def require_same_user
    if current_user != @user 
      flash['alert']= "You can't do that"
      redirect_to root_path
    end
  end 

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
