class PostsController < ApplicationController
  
  before_action :set_post, only:[:vote,:show, :edit, :update]
  before_action :require_user, except:[:index,:show]

  def index
    @posts= Post.all  
    flash["alert"]= params[:error]
  end

  def show
    @comment = Comment.new
  end
  
  def vote
    @vote= Vote.create(voteable:@post, creator:current_user,vote:params[:vote])
    respond_to do |format|
      format.html do
        if @vote.valid? 
          flash['success']='Your vote was counted'
        else
          @vote.delete
        end
        redirect_to :back
      end
    format.js 
    end
  end

  def unvote
    post = Post.find(params[:id])
    vote = post.votes.find_by(creator:current_user)
    vote.delete
    redirect_to :back
  end

  def change_vote

  end


  def new
    @post = Post.new
  end

  def create
    @post= Post.new(post_params)
    @post.creator = current_user
    if @post.save
      flash["Success"]= "Saved"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash["success"]= "Post has been edited"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :creator, :description, :category_ids =>[])
  end
  

end
