class Api::MusicLinksController < ApplicationController
  def index
    @music_links = MusicLink.all
    render "index.json.jb"
  end

  def create
    authenticate_user
    # current_artist = current_user.artists.find_by(id: ["artist_id"])
    @music_link = MusicLink.new(
      url: params["url"],
      artist_id: params["artist_id"],
    )
    if @music_link.save
      render "show.json.jb"
    else
      render json: { errors: @music_link.errors.full_messages }
    end
  end

  def show
    @music_link = MusicLink.find_by(id: params["id"])
    render "show.json.jb"
  end

  def edit
    @music_link = MusicLink.find_by(id: params["id"])
    @music_link.url = params["url"] || @music_link.url
    if @music_link.save
      render "show.json.jb"
    else
      render json: { errors: @music_link.errors.full_messages }
    end
  end

  def destroy
    authenticate_user
    music_link = current_user.artists.find_by(id: params["artist_id"]).music_links.find_by(id: params["id"])
    render json: { message: "Link deleted" }
  end
end
