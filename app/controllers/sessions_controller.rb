class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_watchlists_path(current_user)
    end
  end

  def create

    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_watchlists_path(@user)
    else
      flash[:alert] = "Wrong email and/or password"
      render :new
    end
  end

  def destroy
    if logged_in?
      session.clear
      redirect_to '/'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create_by_facebook
    @user = User.find_by(email: auth[:info][:email])
    if @user
      session[:user_id] = @user.id
      redirect_to user_watchlists_path(@user)
    else
      @user = User.create(name: auth[:info][:name], email: auth[:info][:email], uid: auth[:uid], password_digest: SecureRandom.hex)
      session[:user_id] = @user.id
      redirect_to user_watchlists_path(@user)
    end
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
