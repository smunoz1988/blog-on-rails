class PostsController < ApplicationController
  def index
    # @user = User.find(params[:user_id])
    @user = User.includes(posts: :comments).find(params[:user_id])
    # @posts = @user.posts
    # @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def increment_likes
    @post = Post.find(params[:id])
    @post.increment!(:likes_counter)
    redirect_to user_post_path(@post.author_id, @post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @author = @post.author
    @author.decrement!(:posts_counter)
    @post.destroy!
    redirect_to user_posts_path(id: @author.id), notice: 'Post was deleted successfully!'
  end
end
