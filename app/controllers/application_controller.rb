class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# this line makes the two listed methods available to the views (not included as standard)
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that Action"
      redirect_to_root_path
    end
  end
end
