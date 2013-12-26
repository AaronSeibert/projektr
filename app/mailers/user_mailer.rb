class UserMailer < ActionMailer::Base
  Rails.env.production?
    default from: "noreply@automated.binaryitsystems.com"
  Rails.env.development?
    default from: "noreply@sandbox11314.mailgun.org"
  Rails.env.staging?
    default from: "noreply@sandbox11314.mailgun.org"
  
  
  def welcome_email(user)
    
  Rails.env.production?
    @url = 'http://projects.binaryitsystems.com'
  Rails.env.development?
    @url = 'http://172.16.25.150:3000'
  Rails.env.staging?
    @url = 'http://still-beach-8899.herokuapp.com'
    
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  
 
end
