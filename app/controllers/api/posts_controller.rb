class Api::PostsController < ApplicationController
  before_action :authenticate_user
  #only signed in users can view and edit posts

  def index
    @posts = Post.all
    render "index.json.jb"
  end

  def create
    @post = Post.new(
      text: params["text"],
      artist_id: current_user.aritists.find_by(artist_id: params["artist_id"]), #should come from current_artist
      user_id: current_user.id,
    )
    if @post.save
      render "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }
    end
  end

  def show
    @post = Post.find_by(id: params["id"])
    render "show.json.jb"
  end

  def destroy
    post = Post.find_by(id: params["id"])
    post.destroy
    render json: { message: "Post deleted" }
  end
end
