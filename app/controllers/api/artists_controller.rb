class Api::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render "index.json.jb"
  end

  def show
    @artist = Artist.find_by(id: params["id"])
    render "show.json.jb"
  end

  def edit
    @artist = Artist.find_by(id: params["id"])
    @artist.name = params["name"] || @artist.name
    @artist.bio = params["bio"] || @artist.bio
    @artist.location = params["location"] || @artist.location
    @artist.members = params["members"] || @artist.members
    @artist.genre = params["genre"] || @artist.genre
    @artist.email = params["email"] || @artist.email
    if @artist.save
      render "show.json.jb"
    else
      render json: { errors: @artist.errors.full_messages }
    end
  end
end
