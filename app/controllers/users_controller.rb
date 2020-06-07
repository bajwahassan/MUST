class UsersController < ApplicationController
  def index
    if !logged_in?
      redirect_to "/"
    end
  end
  def new
    if logged_in?
      redirect_to user_watchlists_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_watchlists_path(@user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,)
  end
end
