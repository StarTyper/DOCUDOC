class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user && current_user.role == "admin"
      # Admin-specific logic
      redirect_to clients_path
    else
      # Non-admin logic
      current_user ? redirect_to(client_path(current_user.client)) : redirect_to(new_user_session_path)
    end
  end
end
