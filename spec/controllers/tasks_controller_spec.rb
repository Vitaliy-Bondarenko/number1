require 'rails_helper'

describe TasksController do
	

	describe "#show" do

		it "Show task" do
			@task = Task.new(title: "Andy", description: "Lindeman", )
			#get :show, id: @task.id
			#response.should render_template('show')
			
		end
	end

	describe "#create" do

		it "create task" do
			task = Task.new(title: "Andy", description: "Lindeman", priority: "5", due_date: "2020-08-01")
			#get :show, id: @task.id
			#response.should render_template('show')
			
		end
	end
end 