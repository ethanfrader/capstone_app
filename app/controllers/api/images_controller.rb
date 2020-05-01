class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    render "index.json.jb"
  end

  def create
    authenticate_user
    current_artist = current_user.artists.find_by(id: params["artist_id"])
    @image = Image.new(
      artist_id: current_artist.id,
      url: params["url"],
    )
    if @image.save
      render "show.json.jb"
    else
      render json: { errors: @image.errors.full_messages }
    end
  end

  def show
    @image = Image.find_by(id: params["id"])
    render "show.json.jb"
  end

  def destroy
    authenticate_user
    image = current_user.artists.find_by(id: params["artist_id"]).images.find_by(id: params["id"])
    image.destroy
    render json: { message: "Image deleted" }
  end
end
