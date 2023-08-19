class Users::RegistrationsController < Devise::RegistrationsController
  after_action :send_welcome_email, only: :create

  respond_to :json
  private
  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end
  def register_success
    render json: { message: 'Signed up successfully! Welcome to the world of ChirpIt API' }
  end
  def register_failed
    render json: { message: "Something went wrong while signing up! Please try again." }
  end
  def send_welcome_email
    UserMailer.welcome_email(current_user).deliver_now
  end
end