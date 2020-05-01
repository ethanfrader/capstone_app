class Api::MusicLinksController < ApplicationController
  def index
    @music_links = MusicLink.all
    render "index.json.jb"
  end

  def show
    @music_link = MusicLink.find_by(id: params["id"])
    render "show.json.jb"
  end
end
