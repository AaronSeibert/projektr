class UserMailer < ActionMailer::Base
  default from: "noreply@binaryitsystems.com"
  
  def welcome_email(user)
    @user = user
    @url  = 'http://172.16.25.150:3000'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
