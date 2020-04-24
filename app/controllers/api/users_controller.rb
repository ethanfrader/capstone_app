class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render "index.json.jb"
  end

  def create
    @user = User.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
      password: params["password"],
      password_confirmation: params["password_confirmation"],
      profile_picture: params["profile_picture"],
    )
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def show
    @user = User.find_by(id: params["id"])
    render "show.json.jb"
  end

  def edit
    @user = User.find_by(params["id"])
    @user.first_name = params["first_name"] || @user.first_name
    @user.last_name = params["last_name"] || @user.last_name
    @user.profile_picture = params["profile_picture"] || @user.profile_picture
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }
    end
  end
end
