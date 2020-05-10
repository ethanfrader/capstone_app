class Api::MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    @messages = current_user.messages
    @messages << Message.all.where(recipient_id: params["artist_id"].to_i) #grab received messages using artist_id param
    @messages = @messages.sort_by(&:created_at) #sort them by creation
    @messages = @messages.reverse
    render "index.json.jb"
  end

  def create
    @messages = Message.new(
      user_id: current_user.id,
      artist_id: current_user.artists.find_by(id: params["artist_id"]).id,
      text: params["text"],
      recipient_id: params["recipient_id"],
    )
    if @message.save
      render "index.json.jb"
    else
      render json: { errors: @message.errors.full_messages }
    end
  end
end
