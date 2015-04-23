class PostsController < ApplicationController
  
  before_action :set_post, only:[:vote,:show, :edit, :update]
  before_action :require_user, except:[:index,:show]

  def index

    if logged_in?
      @posts= Post.all
      @voted= posts_voted_by_users
  	  @posts = Post.where.not(id: posts_voted_by_users)
    else
      @posts= Post.all
      flash["alert"]= params[:error]
    end

  end

  def show
    @comment = Comment.new
  end
  

  def vote
    @vote= Vote.create(voteable:@post, creator:current_user,vote:params[:vote])
    if @vote.valid? 
      flash['success']= "Your vote was counted"
    else
      flash['alert']= 'You can only cast one vote'
    end
      redirect_to :back
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

  def unvote
    post = Post.find(params[:id])
    @vote = post.votes.find_by_user_id(current_user)

    if @vote.delete
      redirect_to :back
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
