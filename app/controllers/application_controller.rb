class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user 

  def current_user 
    return unless session[:user_id]
    @current_user = User.where(id: session[:user_id]).first 
  end
  

  def home 
    render html: 'hello world'
  end

end
