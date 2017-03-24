module Api::V1
  class UsersController < ApplicationController

    # POST /users
    def create
      @user = User.new(user_params)
      if user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # GET /users/1
    def show
      render json: @current_user, status: :ok
    end

    # PATCH/PUT /users/1
    def update
      if @current_user.update(user_params)
        render json: @current_user
      else
        render json: @current_user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :role, :password, :password_confirmation)
    end

  end
end
