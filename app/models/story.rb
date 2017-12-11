class Story < ApplicationRecord
  validates :name,:link, presence: true 
  belongs_to :user 
  acts_as_votable 
  has_many :comments 

end
