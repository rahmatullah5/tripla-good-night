class SleepsController < ApplicationController
  before_action :set_sleep, only: %i[ show edit update destroy ]

  # GET /sleeps or /sleeps.json
  def index
    @sleeps = Sleep.all
  end

  # GET /sleeps/1 or /sleeps/1.json
  def show
  end

  # GET /sleeps/new
  def new
    @sleep = Sleep.new
  end

  # GET /sleeps/1/edit
  def edit
  end

  # POST /sleeps or /sleeps.json
  def create
    @sleep = Sleep.new(sleep_params)

    respond_to do |format|
      if @sleep.save
        format.html { redirect_to sleep_url(@sleep), notice: "Sleep was successfully created." }
        format.json { render :show, status: :created, location: @sleep }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sleep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sleeps/1 or /sleeps/1.json
  def update
    respond_to do |format|
      if @sleep.update(sleep_params)
        format.html { redirect_to sleep_url(@sleep), notice: "Sleep was successfully updated." }
        format.json { render :show, status: :ok, location: @sleep }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sleep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sleeps/1 or /sleeps/1.json
  def destroy
    @sleep.destroy

    respond_to do |format|
      format.html { redirect_to sleeps_url, notice: "Sleep was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sleep
      @sleep = Sleep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sleep_params
      params.require(:sleep).permit(:user_id, :clock_in, :clock_out)
    end
end
