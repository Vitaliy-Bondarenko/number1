class TasksController < ApplicationController
	helper_method :sort_column, :sort_direction, 

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_param)
		@task.user = current_user
		if @task.save
    		redirect_to tasks_path
  			else
    		render 'new'
  		end
	end

	def index
		#binding.pry
		@task = current_user.tasks.order(sort_column + " " + sort_direction)
		# + " " + params[:direction])
		#current_user.tasks
	end	

	def edit
  		@task = Task.find(params[:id])
	end

	def show
  		@task = Task.find(params[:id])
	end

	def destroy
  		@tasks = [Task.find(params[:id])]
  		@user_mail = current_user
  		#@tasks.destroy 
  		#redirect_to tasks_path
  		RegistrationMailer.task_destroyed(@tasks, @user_mail).deliver
  		
	end

	def update
  		@task = Task.find(params[:id])
   		if @task.update(task_param)
    		redirect_to tasks_path
  		else
    		render 'edit'
  		end
	end

	def delete_tasks
		#binding.pry
		@user_mail = current_user
	  	@tasks = Task.find(params[:task_ids])
	  	Task.delete(params[:task_ids])
	  	redirect_to tasks_path
	  	RegistrationMailer.task_destroyed(@tasks, @user_mail).deliver
	end


	private 

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

 def task_param 
  params.require(:task).permit(:title, :description, :priority, :due_date) 
 end

end
