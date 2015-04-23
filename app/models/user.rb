class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes
  
  validates :username, presence:true, uniqueness: true
  validates :password, presence:true, length: {minimum: 5}, on: :create

  has_secure_password validations: false




end