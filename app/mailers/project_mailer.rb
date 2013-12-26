class ProjectMailer < ActionMailer::Base
  Rails.env.production?
    default from: "noreply@automated.binaryitsystems.com"
  Rails.env.development?
    default from: "noreply@sandbox11314.mailgun.org"
  
  
  
  def project_link_email(project,user)
    @project = project
    mail(to: user.email, subject: 'View your project online')
  end
  
  def new_revision_email(revision)
    @revision = revision
    @project = @revision.project
    @users = @project.users
    
    @users.each do |u|
      @user = u
      mail(to: @user.email, subject: @revision.name  + ' has been posted for ' + @project.name)
    end
  end
 
end
