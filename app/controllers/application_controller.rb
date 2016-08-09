class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :updated_friendly_time

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def updated_friendly_time
    updated_at.strftime("%B %e, %Y")
  end

  def authenticate_admin!
    unless current_user && current_user.admin
      flash[:warning] = "Action forbidden"
      redirect_to "/"
    end
  end

  def authenticate_user!
    unless current_user
      flash[:warning] = "Please sign in first"
      redirect_to "/login"
    end
  end
  
end
