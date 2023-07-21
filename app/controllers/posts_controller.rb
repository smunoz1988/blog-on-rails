class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def increment_likes
    @post = Post.find(params[:id])
    @post.increment!(:likes_counter)
    redirect_to user_post_path(@post.author_id, @post.id)
  end
end
