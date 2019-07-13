class PostsController < ApplicationController
  before_action :current_post, only: [:edit, :update, :destroy, :show]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def update
    if @post.update_attributes post_params
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def edit
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to post_path @post
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def current_post
    @post = Post.find_by id: params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
