class SessionsController < ApplicationController

  def new
  end





  def create

    @current_user= User.find_by(email: params[:email])
    if @current_user and @current_user.authenticate(params[:password])
      session[:user_id]= @current_user.id 
      flash[:notice] = "Welcome #{@current_user.name } !"
      redirect_to stories_path
    else 
      flash[:notice] = "Invalid Email or Password, please try again"
      render 'new'
    end

  end

  def destroy
    session[:user_id]=@current_user=nil 
    redirect_to stories_path
  end

end
