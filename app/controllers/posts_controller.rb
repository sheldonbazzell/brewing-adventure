class PostsController < ApplicationController
  # before_action :require_login
  def index
  	@posts = Post.all
  end

  def new
  end

  def create
    if current_user.admin
      post = Post.create( post_params )
      image = Image.create( avatar:params[:post][:avatar], post:post )
      redirect_to '/posts'
    else
      redirect_to '/posts/new'
    end
  end

  private
  def post_params
  	params.require(:post).permit(:title, :content, :user_id)
  end

end
