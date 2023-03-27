# frozen_string_literal: true

module Api
  module V1
    module Users
      class FollowersController < ApiController
        before_action :set_user
        before_action :set_follower, only: %i[show update destroy]

        # GET /api/v1/users/1/followers or /api/v1/users/1/followers.json
        def index
          render json: @user.followers.all, status: :ok
        end

        # GET /api/v1/users/1/followers/2 or /api/v1/users/1/followers/2.json
        def show
          render json: @follower, status: :ok
        end

        # GET /api/v1/users/new
        def new
          @follower = @user.followers.new
        end

        # POST /api/v1/users/1/followers or /api/v1/users/1/followers.json
        def create
          @follower = @user.followers.new(follower_params)

          if @follower.save
            render json: @follower, status: :created
          else
            render json: @follower.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/v1/users/1/followers/2 or /api/v1/users/1/followers/2.json
        def update
          if @follower.update(follower_params)
            render json: @follower, status: :created
          else
            render json: @follower.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/v1/users/1/followers/2 or /api/v1/users/1/followers/2.json
        def destroy
          @follower.destroy

          head :no_content
        end

        private

        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:user_id])
        end

        def set_follower
          @follower = @user.followers.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def follower_params
          params.permit(:follower_id)
        end
      end
    end
  end
end
