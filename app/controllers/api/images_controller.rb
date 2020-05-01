class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    render "index.json.jb"
  end

  def create
    authenticate_user
    @image = Image.new(
      artist_id: current_user.artists.find_by(artist_id: params("artist_id")),
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
end
