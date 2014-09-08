require 'spec_helper'

describe TasksController, :type => :controller do
		let(:user) { create(:user) }
		let(:task) { create(:task, user_id: user.id) }

	describe "#show" do
		
		

		it "View the task successfully" do

			#binding.pry
			session[:user_id] = user.id
			get :show, id: task.id
			response.should render_template('show')
			#response.should render_template :show
		end

		it "View a task does not belong to the user" do
			session[:user_id] = user.id-1
			get :show, id: task.id
			response.should redirect_to(tasks_path)
		end
	end

	describe "#edit" do

		it "Edit the task successfully" do
			#binding.pry
			session[:user_id] = user.id
			get :edit, id: task.id
			response.should render_template('edit')
		end
	
		it "Edit a task does not belong to the user" do
			session[:user_id] = user.id-1
			get :edit, id: task.id
			response.should redirect_to(tasks_path)
		end
	end

	describe "#index" do

		it "mapping task belonging to user" do
			#binding.pry
			session[:user_id] = user.id
			get :index
			response.should render_template('index')
		end
	
		it "index in the absence of authorization" do
			session[:user_id] = nil
			get :index
			response.should redirect_to(root_path)
		end
	end

	describe "#new" do

		it "mapping task belonging to user" do
			#binding.pry
			session[:user_id] = user.id
			get :new
			response.should render_template('new')
		end
	
		it "Delete a task does not belong to the user" do
			session[:user_id] = nil
			get :new
			response.should redirect_to(root_path)
		end
	end

	describe "#create" do

		it "create task" do
			#binding.pry
			session[:user_id] = user.id
			post :create, task: { title: "title", description: "PTN PNX",  priority: "3", due_date: Date.today + 7  }
			response.status.should == 302
			response.should redirect_to(tasks_path)
		end
	
		it "create task fail" do
			session[:user_id] = user.id
			post :create, task: { title: "tit", description: "PTN PNX",  priority: "3", due_date: Date.today + 7  }
			response.status.should == 200
			response.should render_template(:new)
			assigns(:task).should be_invalid
			#assigns(:task).errors.messages.should eq(["can't be blank"])
			#render_to(new_task_path)
			
		end
	end

	describe "#destroy" do

		it "destroy task" do
			#binding.pry
			session[:user_id] = user.id
			delete :destroy, id: task.id
			#response.should render_template('destroy')
			response.should render_template('mailers/task_destroyed')
		end
	end

	describe "#delete_tasks" do
		let(:task2) { create(:task, user_id: user.id) }

		it "delete task chekbox" do
			#binding.pry
			session[:user_id] = user.id
			delete :delete_tasks, task_ids: [task.id, task2.id]
			#binding.pry
			#response.should render_template('destroy')
			response.should render_template('mailers/task_destroyed')
		end

		it "delete task chekbox = 0 (params[:task_ids] = nil)" do
			#binding.pry
			session[:user_id] = user.id
			delete :delete_tasks, task_ids: []
			#binding.pry
			#response.should render_template('destroy')
			response.should redirect_to(tasks_path)
		end
	end

	describe "#update" do

		it "update task" do
			#session[:user_id] = user.id
			patch :update, id: task.id, task: {priority: task.priority + 1 }
			#assigns(:task).errors.messages.should eq(["can't be blank"])
			#response.status.should == 302
			response.should redirect_to(tasks_path)
		end
	end

end 