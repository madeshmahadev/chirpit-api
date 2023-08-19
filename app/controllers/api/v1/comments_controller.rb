class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_comment, only: [:show, :update, :destroy]

  # GET /api/v1/comments
  def index
    @api_v1_comments = Api::V1::Comment.all
    if @api_v1_comments.empty?
      render json: { message: "Empty Comments!" }, status: :ok
    else
      render json: @api_v1_comments
    end
  end

  # GET /api/v1/comments/1
  def show
    if @api_v1_comment
      render json: @api_v1_comment
    else
      render json: { error: "Comment not found" }, status: :not_found
    end
  end

  # POST /api/v1/comments
  def create
    @api_v1_comment = Api::V1::Comment.new(api_v1_comment_params)

    if @api_v1_comment.save
      render json: @api_v1_comment, status: :created, location: @api_v1_comment
    else
      render json: @api_v1_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/comments/1
  def update
    if @api_v1_comment.update(api_v1_comment_params)
      render json: @api_v1_comment
    else
      render json: @api_v1_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/comments/1
  def destroy
    @api_v1_comment.destroy
    render json: "Comment Deleted Successfully!"
  end

  # GET /api/v1/comments_by_chirp/:chirp_id
  def comments_by_chirp
    chirp_id = params[:chirp_id]
    @api_v1_comments = Api::V1::Comment.where(api_v1_chirp_id: chirp_id)

    render json: @api_v1_comments
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_comment
      @api_v1_comment = Api::V1::Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_comment_params
      params.require(:api_v1_comment).permit(:user_id, :api_v1_chirp_id, :body)
    end
end
