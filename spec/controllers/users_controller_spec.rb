require 'spec_helper'

describe UsersController, :type => :controller do
		let!(:user) { create(:user) }
		#let(:task) { create(:task, user_id: user.id) }

	describe "#create" do		

		it "Create the user successfully" do
			#binding.pry
			session[:user_id] = nil
			post :create, user: { email: Faker::Internet.email, fname: Faker::Name.first_name, lname: Faker::Name.last_name, password: Faker::Internet.password(8) , age: "28" }
			response.should redirect_to(root_url)
		end

		it "Create the user fail, 'age' no is integer" do
			post :create, user: { email: Faker::Internet.email, fname: Faker::Name.first_name, lname: Faker::Name.last_name, password: Faker::Internet.password(8) , age: "fddssdgs" }
			response.status.should == 200
			response.should render_template(:new)
			assigns(:user).should be_invalid
			#assigns(:user).errors.messages.should eq(["can't be blank"])
		end

		it "Create the user fail, open session" do
			#binding.pry
			session[:user_id] = user.id
			post :create, user: { email: Faker::Internet.email, fname: Faker::Name.first_name, lname: Faker::Name.last_name, password: Faker::Internet.password(8) , age: "28" }
			response.should redirect_to(tasks_path)
		end
	end


	describe "#registration_user" do		

		it "registration user successfully" do
			session[:user_id] = nil
			user.active_code = Digest::MD5.hexdigest user.email
			#binding.pry
			user.save
			get :registration_user, active_code: user.active_code    

			#post :create, user: { email: Faker::Internet.email, fname: Faker::Name.first_name, lname: Faker::Name.last_name, password: Faker::Internet.password(8) , age: "28" }
			response.should redirect_to(root_url)
		end

		it "registration user fail, open session" do
			session[:user_id] = user.id
			user.active_code = Digest::MD5.hexdigest user.email
			#binding.pry
			user.save
			get :registration_user, active_code: user.active_code    

			#post :create, user: { email: Faker::Internet.email, fname: Faker::Name.first_name, lname: Faker::Name.last_name, password: Faker::Internet.password(8) , age: "28" }
			response.should redirect_to(tasks_path)
		end
	
	end
end