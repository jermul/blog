class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include SessionsHelper
  

  Disqus::defaults[:account] = 'jermdisorder'
  Disqus::defaults[:developer] = true # if you want to test it on the localhost
  Disqus::defaults[:hide_mods] = true
  Disqus::defaults[:show_powered_by] = false

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
    
    def authorize
      redirect_to login_url, alert: "Not authorized" if current_user.nil?
    end  
end
