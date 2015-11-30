class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :get_url_path
  
  private
  # 确保用户已登录
    def logged_in_user
      #authenticate_openid!
      unless logged_in?
      store_location
      flash[:danger] = "您尚未登陆,请登录后再操作."
      redirect_to(login_url) and return
      end
    end
    
     def is_admin_user
      p "---------logged_in?#{logged_in?}----------------"
       p "---------current_user.admin?#{current_user.admin?}----------------"
      unless logged_in? && current_user.admin?
        store_location
        flash[:danger] = "您不是管理员."
        redirect_to '/login'
        #authenticate_openid!
      end
    end
   
    def get_url_path
      p "-----------------request.url:#{request.url}----------------------------"
      @url_path = URI(request.url).path
      Rails.logger.info "---------------------------url_path=#{@url_path}--------------------"
    end
 
end
