class Story < ApplicationRecord
  validates :name,:link, presence: true 
  has_many :votes 
  belongs_to :user 
  
end
