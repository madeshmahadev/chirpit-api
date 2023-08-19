class Api::V1::ChirpsController < ApplicationController
  before_action :authenticate_user!

  # GET /api/v1/chirps
  def index
    @api_v1_chirps = current_user.api_v1_chirps.all.includes(:comments)
    if @api_v1_chirps.empty?
      render json: { message: "Empty Chirps!" }, status: :ok
    else
      render json: @api_v1_chirps, include: :comments
    end
  end

  # GET /api/v1/chirps/1
  def show
    @api_v1_chirp = current_user.api_v1_chirps.includes(:comments).find_by(id: params[:id])

    if @api_v1_chirp
      render json: @api_v1_chirp, include: :comments
    else
      render json: { error: "Chirp not found" }, status: :not_found
    end
  end

  # POST /api/v1/chirps
  def create
    @api_v1_chirp = current_user.api_v1_chirps.new(api_v1_chirp_params)

    if @api_v1_chirp.save
      render json: @api_v1_chirp, status: :created, location: @api_v1_chirp
    else
      render json: @api_v1_chirp.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/chirps/1
  def update
    @api_v1_chirp= current_user.api_v1_chirps.find(params[:id])
    if @api_v1_chirp.update(api_v1_chirp_params)
      render json: @api_v1_chirp
    else
      render json: @api_v1_chirp.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/chirps/1
  def destroy
    @api_v1_chirp= current_user.api_v1_chirps.find(params[:id])
    @api_v1_chirp.destroy
    render json: "Chirp Deleted Successfully!"
  end

  private

    # Only allow a list of trusted parameters through.
    def api_v1_chirp_params
      params.require(:api_v1_chirp).permit(:body, :user_id)
    end
end
