class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :check_owner, only: [:new, :create]

  def new
    @user = User.new(client_id: params[:client_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  def index
    @client = Client.find(params[:client_id])
    @user = current_user
    @users = User.where(client_id: @client.id)
  end

  def edit
    @user = User.find(params[:id])
    @user.client_id = params[:client_id]
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :firstname, :lastname, :role, :client_id)
  end

  def check_owner
    return if (current_user && current_user.role == 'owner') || current_user.role == 'admin'

    redirect_to root_path, alert: 'Not authorized to perform this action.'
  end
end
