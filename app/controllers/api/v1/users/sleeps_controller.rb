# frozen_string_literal: true

module Api
  module V1
    module Users
      class SleepsController < ApiController
        before_action :set_user
        before_action :set_sleep, only: %i[show update destroy]

        # GET /api/v1/users/1/sleeps.json or /api/v1/users/1/sleeps.json
        def index
          form = Forms::Api::V1::Users::Sleeps::IndexForm.new(search_params)
          if form.valid?
            # Get the sleeps based on the validated params
            sleeps = Sleep
                     .where('clock_in BETWEEN ? AND ?', form.from_date, form.to_date)
                     .order(Arel.sql("#{form.sort_by} #{form.sort_type}"))

            render json: sleeps, status: :ok
          else
            render json: { errors: form.errors.full_messages }, status: :unprocessable_entity
          end
        end

        # GET /api/v1/users/1/sleeps/2 or /api/v1/users/1/sleeps/2.json
        def show
          render json: @sleep, status: :ok
        end

        # GET /api/v1/users/new
        def new
          @sleep = @user.sleeps.new
        end

        # POST /api/v1/users/1/sleeps or /api/v1/users/1/sleeps.json
        def create
          @sleep = @user.sleeps.new(sleep_params)

          if @sleep.save
            render json: @sleep, status: :created
          else
            render json: @sleep.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /api/v1/users/1/sleeps/2 or /api/v1/users/1/sleeps/2.json
        def update
          if @sleep.update(sleep_params)
            render json: @sleep, status: :created
          else
            render json: @sleep.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/v1/users/1/sleeps/2 or /api/v1/users/1/sleeps/2.json
        def destroy
          @sleep.destroy

          head :no_content
        end

        private

        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:user_id])
        end

        def set_sleep
          @sleep = @user.sleeps.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def sleep_params
          params.permit(:clock_in, :clock_out)
        end

        def search_params
          params.permit(:sort_by, :sort_type, :from_date, :to_date)
        end
      end
    end
  end
end
