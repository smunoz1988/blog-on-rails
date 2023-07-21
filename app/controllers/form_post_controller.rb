class FormPostController < ApplicationController
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
      flash[:success] = "Post was successfully created."
      redirect_to users_path
    else
      flash.now[:alert] = "Error: Post could not be created."
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end