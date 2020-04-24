class Api::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render "index.json.jb"
  end

  def show
    @artist = Artist.find_by(id: params["id"])
    render "show.json.jb"
  end
end
