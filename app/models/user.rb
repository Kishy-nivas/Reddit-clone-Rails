class User < ApplicationRecord
  has_many :stories 
  
  has_secure_password 
  validates_confirmation_of :password 
  validates_presence_of :password,on: create 
  validates_presence_of :email, on: create, message: "can't be blank"
  validates_uniqueness_of :email
  validates_uniqueness_of :name, on: create,message: "Username already taken" 

   acts_as_voter 
  has_many :comments 


end
