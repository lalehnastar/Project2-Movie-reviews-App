class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  if @user.save
    
    #user created their account. lets log them in.
    session[:user_id] = @user.id

    redirect_to movies_path
  else
    flash[:warning] = "Check your email and password"
    render 'new'
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
  
    if @user.update(user_params)
      redirect_to @user
    else
      
      render 'edit'
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy

    redirect_to users_path
  end
  
  #we put private so that noone else can create another field 
  private 
  def user_params

    return params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
