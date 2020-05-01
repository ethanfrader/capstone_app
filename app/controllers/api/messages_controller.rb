class Api::MessagesController < ApplicationController
  before_action :authenticate_user

  def index #need to update the model/association to return a full artist for recipient id
    @messages = current_user.messages
    render "index.json.jb"
  end
end
