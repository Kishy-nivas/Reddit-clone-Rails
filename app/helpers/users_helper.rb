module UsersHelper
  def post_points user 
    sum =0 
    story  = []
    user.stories.each do |s| 
      sum += s.get_likes.size 
      story.push s.name
    end 
    return sum,story 
  end



end
