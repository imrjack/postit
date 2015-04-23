class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


helper_method :current_user, :logged_in?, :posts_voted_by_users

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #Will return nil if session[:user_id] does not exist instead of exception
    # ^^ Memoization: This means User.find will only execute if @current_user doesn't exist  
  end

  def logged_in?
      !!current_user #!! turns obj into boolean.  
  end

  def require_user
    if !logged_in?
      flash[:error]= "Must be logged in to do that"
      redirect_to root_path
    end
  end


  def posts_voted_by_users
    if logged_in?
    votes= []
    posts = []
    current_user.votes.each do |vote|
      votes << vote.voteable_id
    end
    @posts.each do |post|
      posts << post.id  
    end

    match = votes & posts
    voted = []
    @posts.each do |post|
      if match.include?(post.id)
        voted << post
      end
    end
    return voted
  end
  end

end


