class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def registration_confirmation(lead)
    @lead = lead
    mail to: 'karthikeyan@spinircle.com', subject: "New Lead..!!!"
  end

end
