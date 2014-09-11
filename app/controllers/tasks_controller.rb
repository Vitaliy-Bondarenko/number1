class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction, 

  def new
    if current_user == nil
      redirect_to root_path   
    else 
      @task = Task.new
    end
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
    if current_user == nil
      redirect_to root_path   
    else 
      @tasks = current_user.tasks.order(sort_column + " " + sort_direction)
    end
  end 

  def edit
    @task = Task.find(params[:id])
    if current_user == nil
      redirect_to root_path
    elsif current_user.id != @task.user_id
      redirect_to tasks_path
    end
  end

  def show
    @task = Task.find(params[:id])
    if current_user == nil
      redirect_to root_path
    elsif current_user.id != @task.user_id
     redirect_to tasks_path
    end
  end

  def destroy
    @tasks = [Task.find(params[:id])]
    @user_mail = current_user
    @tasks.delete(params[:id])
    RegistrationMailer.task_destroyed(@tasks, @user_mail).deliver
    render nothing: true
  end

  def update
    @task = Task.find(params[:id])
    if @task.errors.empty?  
      @task.update(task_param)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def delete_tasks
    @user_mail = current_user
    if params[:task_ids] != nil
      @tasks = Task.find(params[:task_ids])
      Task.delete(params[:task_ids])
      RegistrationMailer.task_destroyed(@tasks, @user_mail).deliver
    end
    redirect_to tasks_path
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