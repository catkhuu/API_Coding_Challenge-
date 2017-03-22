module Api::V1
  class SessionsController < ApplicationController

    # POST /sessions
    def create
      binding.pry
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        User.set_auth_token(user)
        render json: user.as_json(only: [:username, :auth_token]), status: :ok
      else
        head(:unauthorized)
      end
    end

    # DELETE /sessions
    def destroy
      current_user.auth_token.destroy
      head(:ok)
    end
  end
end
