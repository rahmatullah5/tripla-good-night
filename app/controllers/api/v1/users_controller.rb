# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      before_action :set_user, only: %i[show edit update destroy]

      # GET /api/v1/users or /api/v1/users.json
      def index
        render json: User.all, status: :ok
      end

      # GET /api/v1/users/1 or /api/v1/users/1.json
      def show
        render json: @user, status: :ok
      end

      # GET /api/v1/users/new
      def new
        @user = User.new
      end

      # POST /api/v1/users or /api/v1/users.json
      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/1 or /api/v1/users/1.json
      def update
        if @user.update(user_params)
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/1 or /api/v1/users/1.json
      def destroy
        @user.destroy

        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.permit(:name)
      end
    end
  end
end
