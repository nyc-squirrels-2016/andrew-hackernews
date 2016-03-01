class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    post = Post.find(params[:post_id])
    @comment = Comment.where(post_id: post.id)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to "/posts/#{params[:post_id]}"
    else
      render :new
    end
  end

  def destroy
    @comment= Comment.find(params[:id])
    @comment.destroy
    redirect_to "/posts/#{params[:post_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
