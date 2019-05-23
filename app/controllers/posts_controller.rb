class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :destroy]

  def index
    @posts = Post.all.limit(10).includes(:photos, :user).order('created_at desc')
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      if params[:images]
        params[:images].each do |img|
          @post.photos.create(image: img[1])
        end
      end

      redirect_to posts_path
      flash[:notice] = "Saved ..."
    else
      flash[:alert] = "Something went wrong ..."
      redirect_to posts_path
    end
  end

  def show
    @photos =   @post.photos
  end

  def destroy

  end

  private

  def find_post
    @post = Post.find_by id: params[:id]

    return if @post
    flash[:danger] = "Post doesn't exist!"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit :content
  end
end
