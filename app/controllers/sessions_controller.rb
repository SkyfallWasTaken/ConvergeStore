class SessionsController < ApplicationController
  allow_unauthenticated_access only: [ :new, :create, :omniauth ]

  def new
  end

  def create
    redirect_to "/auth/slack"
  end

  def omniauth
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by(slack_id: auth.uid) do |u|
      u.email = auth.info.email
      u.name = auth.info.name
      u.avatar_url = auth.info.image
    end

    if user.persisted?
      start_new_session_for(user)
      redirect_to after_authentication_url, notice: "Successfully logged in!"
    else
      redirect_to new_session_path, alert: "There was an error logging you in."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: "Logged out!"
  end
end
