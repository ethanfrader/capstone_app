class Api::MusicLinksController < ApplicationController
  def index
    @music_links = MusicLink.all
    render "index.json.jb"
  end
end
