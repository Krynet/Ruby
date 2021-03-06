class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(permit_post)
    if @post.save
      redirect_to post_path(@post)
    else
      rendirect_ro new_post_path
    end
  end

  private
    def permit_post
      params.require(:post).permit(:title,:description)

    end
end
