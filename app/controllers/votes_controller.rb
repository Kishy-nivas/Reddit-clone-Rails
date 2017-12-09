class VotesController < ApplicationController
  before_action :authenticate_user, only: [:create] 

  def create
    story_id = params[:story_id]
    @story = Story.find(story_id)
    @is_voted = Vote.find_by(story_id: story_id, user_id: @current_user.id )
    if  @is_voted.nil?  
      @story.votes.create(user_id: @current_user.id)
      respond_to do |format| 
        format.html{redirect_to @story}
        format.js 
      end 
    
    else 
      delete_vote = @story.votes.find_by(user_id: @current_user.id )
      delete_vote.delete 
      respond_to do |format| 
        format.html{redirect_to @story}
        format.js 
      end 
    
    end
  end 

    def authenticate_user 
    unless session[:user_id]
      flash[:notice] = "please sign-in to upvote "
      redirect_to new_session_path
    else 
      return 
    end
  end


end
