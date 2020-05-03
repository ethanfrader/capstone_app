class Api::MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    @messages = current_user.messages
    @messages << Message.all.where(recipient_id: params["artist_id"].to_i) #grab received messages using artist_id param
    @messages = @messages.sort_by(&:created_at) #sort them by creation
    render "index.json.jb"
  end
end
