class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :updated_friendly_time

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def updated_friendly_time
    updated_at.strftime("%B %e, %Y")
  end
  
end
