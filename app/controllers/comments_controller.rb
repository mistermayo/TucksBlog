class CommentsController < ApplicationController
  respond_to :html, :js

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
      if @comment.save
        respond_to do |format|
          format.html do
            flash[:notice] = "Comment Posted"
            redirect_to post_path(@post)
          end
          format.js
        end
      else
        respond_to do |format|
          format.html do
        flash[:notice] = "Error in comment submission."
        render :new
      end
      format.js { render js: "alert('fail');" }
      end
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
      if @comment.save
        respond_to do |format|
          format.html do
            flash[:notice] = "Comment Posted"
            redirect_to post_path(@post)
          end
          format.js
        end
      end
      else
        respond_to do |format|
          format.html do
            flash[:notice] = "Error in comment submission."
            render :edit
          end
          format.js { render js: "alert('fail');" }
        end
      end
    end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
