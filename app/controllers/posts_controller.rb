class PostsController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :update, :destroy]
  # GET /post
  def index
    # return posts published
    @posts = Post.where(published: true)
    render json: @posts, status: :ok
  end
  # GET /post/{id}
  def show
    @posts = Post.find(params[:id])
    render json: @posts, status: :ok
  end

end
