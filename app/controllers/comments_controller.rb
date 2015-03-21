  class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @post= Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator= User.first
    binding.pry

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def edit
    
  end

  def update
  binding.pry
  end


end
