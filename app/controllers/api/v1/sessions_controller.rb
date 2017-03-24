module Api::V1
  class SessionsController < ApplicationController
    before_action :authenticate, only: [:destroy]

    # POST /sessions
    def create
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        User.set_auth_token(user)
        render json: user.as_json(only: [:id, :username, :auth_token]), status: :ok
      else
        head(:unauthorized)
      end
    end

    # DELETE /sessions/:id
    def destroy
      @current_user.update(auth_token: nil)
      head(:ok)
    end
  end
end
