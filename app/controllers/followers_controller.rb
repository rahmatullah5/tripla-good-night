# frozen_string_literal: true

class FollowersController < ApplicationController
  before_action :set_follower, only: %i[show edit update destroy]

  # GET /followers or /followers.json
  def index
    @followers = Follower.all
  end

  # GET /followers/1 or /followers/1.json
  def show; end

  # GET /followers/new
  def new
    @follower = Follower.new
  end

  # GET /followers/1/edit
  def edit; end

  # POST /followers or /followers.json
  def create
    @follower = Follower.new(follower_params)

    respond_to do |format|
      if @follower.save
        format.html { redirect_to follower_url(@follower), notice: 'Follower was successfully created.' }
        format.json { render :show, status: :created, location: @follower }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /followers/1 or /followers/1.json
  def update
    respond_to do |format|
      if @follower.update(follower_params)
        format.html { redirect_to follower_url(@follower), notice: 'Follower was successfully updated.' }
        format.json { render :show, status: :ok, location: @follower }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /followers/1 or /followers/1.json
  def destroy
    @follower.destroy

    respond_to do |format|
      format.html { redirect_to followers_url, notice: 'Follower was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_follower
    @follower = Follower.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def follower_params
    params.require(:follower).permit(:follower_id, :followee_id)
  end
end
