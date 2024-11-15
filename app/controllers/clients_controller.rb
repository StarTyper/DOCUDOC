class ClientsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client), notice: "Client was successfully created."
    else
      render :new, notice: "Client was not created."
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to client_path(@client), notice: "Client was successfully updated."
    else
      render :edit, notice: "Client was not updated."
    end
  end

  def destroy
    @client = Client.find(params[:id])
    if @client.destroy
      redirect_to clients_path, notice: "Client was successfully deleted."
    else
      redirect_to clients_path, notice: "Client was not deleted."
    end
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end

  def authenticate_admin!
    # Ensure only admins or admins can access
    unless current_user.role == 'admin'
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
