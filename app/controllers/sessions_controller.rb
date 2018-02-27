class SessionsController < ApplicationController
  def new
  end

  def create
    #check to see if user exists
    @user = User.find_by_email(params[:email])
    #if user exists AND their password is correct!
    if @user and @user.authenticate(params[:password])
      #generate a cookie with their id in it
      session[:user_id] = @user.id
      
      #take them to their movies
      redirect_to movies_path
    else 
      flash[:warning] = "Check your email and password"
      #otherwise, try again
      redirect_to new_session_path
  end
end
  def destroy
    #log out version 
    session[:user_id] = nil
    redirect_to root_path
  end
end
