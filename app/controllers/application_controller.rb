class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  
  protected
    def authorize
      unless current_user
        redirect_to :login_url, :notice => "Please log in"
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
end
