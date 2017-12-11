class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :story
  acts_as_votable 
end
