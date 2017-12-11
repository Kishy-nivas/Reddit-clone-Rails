module StoriesHelper
  def display_likes(story)
    votes = story.votes_for.up.by_type(User )
    count_likers(votes)

  end 


  def display_likes_comment (comment)
    votes = comment.votes_for.up.by_type(User )
    count_likers(votes)
  end 

  private 

  def count_likers(votes) 
    vote_count = votes.size 
    vote_count.to_s + ' likes'
  end 

  def like_plural (votes)
    return 'like this' if votes.count <1 
      'likes this '
  end 

end
