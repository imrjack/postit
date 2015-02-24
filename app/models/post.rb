class Post < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "user_id" 
  has_many :comments
  has_many :category_posts
  has_many :categories, through: :category_posts 

  validates :title, presence:true
  validates :url, presence:true
  validates :description, presence:true

end