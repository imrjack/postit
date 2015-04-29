
class Post < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "user_id" 
  has_many :comments
  has_many :category_posts
  has_many :categories, through: :category_posts 
  has_many :votes, :as => :voteable

  validates :title, presence:true
  validates :url, presence:true
  validates :description, presence:true

  include Voteable


end