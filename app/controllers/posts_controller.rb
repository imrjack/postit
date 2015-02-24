class PostsController < ApplicationController
  
  before_filter :set_post, only:[:show, :edit, :update]
  
  def index
  	@posts = Post.all
  end

  def show
  	
  end

  def new
    @post = Post.new
  end

  def create
    @post= Post.new(post_params)
    @post.creator = User.first
    
    if @post.save
      flash[:notice]= "saved"
      redirect_to posts_path
    else
      render :new
    end

  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:notice]= "Post has been edited"
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
    params.require(:post).permit(:title, :url, :creator, :description)
  end

end
