class Api::MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    @messages = []
    received_messages = []
    artists = current_user.artists
    artists.each do |artist|
      received_messages = Message.where(recipient_id: artist.id.to_i)
      received_messages.each do |r_message|
        @messages << r_message
      end
      artist.messages.each do |message|
        @messages << message
      end
    end
    @messages = @messages.uniq
    @messages = @messages.sort_by(&:created_at) #sort them by creation
    @messages = @messages.reverse
    render "index.json.jb"
  end

  def create
    @messages = []
    @message = Message.new(
      user_id: current_user.id,
      artist_id: params["artist_id"],
      text: params["text"],
      recipient_id: params["recipient_id"],
    )
    if @message.save
      @messages << @message
      render "index.json.jb"
    else
      render json: { errors: @message.errors.full_messages }
    end
  end
end
