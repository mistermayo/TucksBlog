class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
      if @comment.save
        flash[:notice] = "Thanks for your comment."
        redirect_to post_path(@post)
      else
        flash[:notice] = "Error in comment submission."
        render :new
      end
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Your comment has been removed."
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(params[:comment])
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
