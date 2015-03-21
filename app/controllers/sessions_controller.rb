class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
        session[:user_id]= user.id #Cookie has a suze limitation so only save id and not User obj.
        flash[:notice]="Your are logged in"
        redirect_to root_path
    else
        flash['error']= "There's something wrong with your username/password"
        render :new
    end
 
  end


  def destroy

    session[:user_id]=nil
    redirect_to root_path

  end

end