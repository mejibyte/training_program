class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :signed_in?
  
  protected
  
  def signed_in?
    session[:admin].present?
  end
  
  def require_user
    redirect_to new_session_path, notice: "Please log in first" unless signed_in?
  end
end
