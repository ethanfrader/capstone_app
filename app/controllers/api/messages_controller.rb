class Api::MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    @messages = []
    received_messages = []
    artists = current_user.artists
    artists.each do |artist|
      received_messages = Message.all.where(recipient_id: artist.id.to_i)
      artist.messages.each do |message|
        @messages << message
      end
    end
    # received_messages = Message.all.where(recipient_id: params["artist_id"].to_i) #grab received messages using artist_id param
    received_messages.each do |r_message|
      @messages << r_message
    end
    @messages = @messages.uniq
    @messages = @messages.sort_by(&:created_at) #sort them by creation
    @messages = @messages.reverse
    render "index.json.jb"
  end

  def create
    @message = Message.new(
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
