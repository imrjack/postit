class Comment < ActiveRecord::Base
    belongs_to :post
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
    has_many :votes, :as => :voteable
    validates :body, presence:true

    include VoteCount
end