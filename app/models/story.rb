class Story < ApplicationRecord
  validates :name,:link, presence: true 
  belongs_to :user 
  acts_as_votable 
  has_many :comments 


  def self.search(search)
    where("name LIKE ? ", "%#{search}%")
  end 
end
