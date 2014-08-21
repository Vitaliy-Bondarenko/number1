class RegistrationMailer < ActionMailer::Base
  default from: "info@mystore.localhost",
  		  template_path: 'mailers'

  def task_destroyed(task, user_mail)
  	@task = task
  	mail(:to => user_mail.email, :subject => "task_destroyed")
  end

  def user_active(user)
  	@user = user
  	mail(:to => user.email, :subject => "Welcome")
  end
end
