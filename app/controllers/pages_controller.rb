class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user && current_user.role == "admin"
      # Admin-specific logic
      redirect_to clients_path
    elsif current_user && current_user.role == "owner"
      # Owner-specific logic
      redirect_to client_path(current_user.client)
    elsif current_user && current_user.role == "doctor"
      # Doctor-specific logic
      redirect_to documentation_path(current_user.client)
    elsif current_user && current_user.role == "assistant"
      # Assistant-specific logic
      redirect_to documentation_path(current_user.client)
    else
      # Default logic
      redirect_to access_denied_path
    end
  end
end
