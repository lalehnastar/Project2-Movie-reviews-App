class ApplicationController < ActionController::Base
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
#returns current user
  def current_user
    return @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

#if a method with question mark means is boolean
  def logged_in?
    #to change a variable into boolean
!!current_user

end

def authorize
  redirect_to new_session_path unless logged_in?
end

end
