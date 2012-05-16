class Rosalie::Mailer < ::ActionMailer::Base

  def deliver_message(user)
    @user = user
    mail(:to => user.email, :subject => "Incoming message")
  end
end