class PostvotesController < ApplicationController
  def upvote
    @post = Post.find(params[:post_id])
    if logged_in? && !current_user.post_voted?(@post)
      flash.now[:alert]= "You already voted"
    end
    @post.post_votes.create(total: 1, user: current_user)
    redirect_to root_path
  end

  def downvote
    @post = Post.find(params[:post_id])
    if current_user.post_voted?(@post)
      flash.now[:alert]= "You already voted"
    end
    @post.post_votes.create(total: -1, user: current_user)
    redirect_to root_path
  end




end
