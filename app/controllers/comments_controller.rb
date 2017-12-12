class CommentsController < ApplicationController
  before_action :authenticate_user,only:[:create,:like,:unlike]



  def create
    @story = Story.find(params[:story_id ])
    @comment =@story.comments.create(comment_params)
    @comment.user_id = @current_user.id 
    @comment.save 
    respond_to do |format| 
      format.html{redirect_to :back}
      format.js  
    end 

  end

  def edit
     @story = Story.find(params[:story_id])
     @comment = Comment.find(params[:id])
  end 

  def update
    @comment = Comment.find(params[:id])
    @story = Story.find(params[:story_id])

    if @comment.update(comment_params)
      flash[:notice] = "comment edited successfully"
      redirect_to @story 
    else 
      render 'edit'
    end 
  end

  def  like 
    @comment = Comment.find(params[:id])
    @story = Story.find(params[:story_id])
    @comment.liked_by current_user 
    respond_to do |format| 
      format.html {redirect_to :back }
      format.js  
    end
  end
  
  def unlike   
    @comment = Comment.find(params[:id])
    @story = Story.find(params[:story_id])
    @comment.unliked_by current_user 
    respond_to do |format| 
      format.html {redirect_to :back}
      format.js  
    end
  end
  
  def authenticate_user 
    unless session[:user_id]
      flash[:notice] = "please sign in to continue"
      redirect_to new_session_path
    else 
      return 
    end
  end 


  private 
  def comment_params 
    params.require(:comment).permit(:description)
  end 
end
