class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  load_and_authorize_resource
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

  def new
    @current_user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @current_user = current_user
    @post = Post.new(post_params)
    @post.author_id = @current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.save
    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to users_path
    else
      flash.now[:alert] = 'Error: Post could not be created.'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def destroy
    @post = Post.find(params[:id])
    @author = @post.author
    @post.destroy!
    redirect_to user_posts_path(id: @author.id), notice: 'Post was deleted successfully!'
  end
end
