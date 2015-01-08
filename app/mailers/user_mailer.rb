class UserMailer < ActionMailer::Base
  default from: ENV["MAIL_FROM"]
  
  def welcome_email(user)
    @url = ENV["APP_URL"]
      
      @user = user
      mail(to: @user.email, subject: 'New Account Created')
  end
  
 
end
