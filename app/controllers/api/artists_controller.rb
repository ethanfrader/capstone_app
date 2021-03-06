class Api::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render "index.json.jb"
  end

  def create #authenticates that user is signed in
    authenticate_user
    @artist = Artist.new(
      name: params["name"],
      bio: params["bio"],
      location: params["location"],
      members: params["members"],
      genre: params["genre"],
      email: params["email"],
    )
    if @artist.save
      @artist_user = ArtistUser.create!(user_id: current_user.id, artist_id: @artist.id, privileges: "default")
      render "show.json.jb"
    else
      render json: { errors: @artist.errors.full_messages }
    end
  end

  def show
    @artist = Artist.find_by(id: params["id"])
    render "show.json.jb"
  end

  #only allows signed in users to eidt their own artist pages
  def edit
    authenticate_user
    @artist = current_user.artists.find_by(id: params["id"])
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

  #allows only signed in users to delete their own artists
  def destroy
    artist = current_user.artists.find_by(id: params["id"])
    artist.destroy
    render json: { message: "Artist successfully deleted!" }
  end
end
