class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?


  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:danger] = "You must be logged in to access this section!"
      redirect_to login_path
    end
  end
end
