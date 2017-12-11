class StoriesController < ApplicationController
  before_action :authenticate_user, except: [:show,:index,]
  before_action :set_story , only: [:edit,:update,:like,:unlike,:show]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new 
  end 

  def create

    if @current_user.stories.create(story_params)  
      flash[:notice] = "Submitted successfully!"
      redirect_to stories_path 
    else
      render 'new'
    end 
  end 


  def edit 
  end 



  def update
    if @story.update(story_params) 
      flash[:notice] = "Editted successfully!"
      redirect_to @story
    else
      render 'edit'
    end 
  end 

  def show 
    @user = User.find_by(id: @story.user_id)
  end 


  def authenticate_user 
    unless session[:user_id]
      flash[:notice] = "please sign in to create a link"
      redirect_to new_session_path
    else 
      return 
    end
  end 

  def like
    @story.liked_by current_user 
    respond_to do |format| 
      format.html {redirect_to :back }
      format.js  
    end
  end


  def unlike 
    @story.unliked_by current_user 
    respond_to do |format| 
      format.html {redirect_to :back}
      format.js  
    end 
  end 



  private 
  def story_params 
    params.require(:story).permit(:name,:link)
  end 

  def set_story 
    @story = Story.find(params[:id])
  end 


end
