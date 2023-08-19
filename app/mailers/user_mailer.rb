class UserMailer < ApplicationMailer
  default from: 'mahadev@ecstasycreatives.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to ChirpIt! Start Chirping it out loud right now!')
  end
end