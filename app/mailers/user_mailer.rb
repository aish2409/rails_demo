class UserMailer < ApplicationMailer
   default from: 'test24mailer@gmail.com'

  def welcome_email(user)
    @user = user
    attachments['demo_attachment.html'] = File.read("/home/oem/demo/project1/app/views/users/demo_attachment.html")
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
