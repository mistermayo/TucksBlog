class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Posted Sucessfully!!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Smell you later, post."
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post])
      redirect_to posts_path
    else
      render :edit
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :date, :body, :user_id)
  end
end
