class ProjectMailer < ActionMailer::Base
  Rails.env.production?
    default from: "noreply@automated.binaryitsystems.com"
  Rails.env.development?
    default from: "noreply@sandbox11314.mailgun.org"
  Rails.env.staging?
    default from: "noreply@sandbox11314.mailgun.org"
  
  
  
  def project_link_email(project,user)
    @project = project
    mail(to: user.email, subject: 'View your project online')
  end
  
  def new_revision_email(revision)
    @revision = revision
    @project = @revision.project
    @users = @project.users
    recipient_vars = {}
    @users.each do |u|
      recipient_vars[u.email] ||= {}
      recipient_vars[u.email]['id'] = u.id
      recipient_vars[u.email]['first_name'] = u.first_name
    end
    
    email = mail(to: @users.pluck(:email), subject: @revision.name  + ' has been posted for ' + @project.name)
    email.mailgun_recipient_variables = recipient_vars
  end
 
end
