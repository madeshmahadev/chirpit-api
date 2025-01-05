class Users::SessionsController < Devise::SessionsController
  respond_to :json
  private

  def respond_with(resource, _opts = {})
    if request.format.json? && user_signed_in?
      render json: { message: 'Login Successful! Welcome to ChirpIt API' }, status: :ok
    else
      render json: { message: 'Please Sign in to view the Chirps!' }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end
  def log_out_success
    render json: { message: "Signed out successfully! Hope to see you back soon!" }, status: :ok
  end
  def log_out_failure
    render json: { message: "Something went wrong while Signing out! Please try again."}, status: :unauthorized
  end
end