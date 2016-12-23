class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  end

  def edit
  end

  def create
  	@post = Post.create( post_params )
    @image = Image.create( avatar:params[:post][:avatar], post:@post )
  	redirect_to '/posts'
  end

  private
  def post_params
  	params.require(:post).permit(:title, :content)
  end

end
