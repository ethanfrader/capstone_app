class Api::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render "index.json.jb"
  end
end
