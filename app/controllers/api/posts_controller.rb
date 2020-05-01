class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render "index.json.jb"
  end

  def create
    @post = Post.new(
      text: params["text"],
      artist_id: params["artist_id"], #should come from current_artist
      user_id: params["user_id"], #should come from current_user
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
