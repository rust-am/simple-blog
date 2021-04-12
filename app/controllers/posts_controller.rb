class PostsController < ApplicationController
  #  вызов @post = Post.find(params[:id]) перед каждым экшном
  before_action :set_post, only: %i{ show edit update destroy }

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Статья создана'
    else
      render :new, danger: 'Статья не создана'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, success: 'Статья обновлена'
    else
      render :edit, danger: 'Статья не обновлена'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, warning: 'Статья удалена'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body)
  end
end
