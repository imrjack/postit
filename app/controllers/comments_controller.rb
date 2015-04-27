class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @post= Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator= User.find(session[:user_id])
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def edit
  end

  def update
  end

  def vote
    comment = Comment.find(params[:id])
    vote = Vote.create(voteable:comment, creator:current_user,vote:params[:vote])
    if vote.valid?
      flash["success"]= 'Your vote was counted'
    else
      flash['alert'] ='You can only vote on a comment once'
    end
    redirect_to :back
  end

  def unvote
    comment = Comment.find(params[:id])
    vote = comment.votes.where(user_id:current_user)
    vote.delete(vote)
    redirect_to :back
  end

  def destroy
    post=Post.find(params[:post_id])
    comment=Comment.find(params[:id])
    comment.delete
    redirect_to :back
  end



end
