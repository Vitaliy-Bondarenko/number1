class RegistrationMailer < ActionMailer::Base
  default from: "info@mystore.localhost",
  		  template_path: 'mailers/tasks'

  def task_destroyed(task, user_mail)
  	@task = task
  	mail(:to => user_mail.email, :subject => "task_destroyed")

  	  	#mail to: 'Joker-tref@ukr.net',
  		#subject: "task_destroyed"
  end
end
