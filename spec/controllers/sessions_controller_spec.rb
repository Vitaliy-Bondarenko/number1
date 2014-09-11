require 'spec_helper'

describe SessionsController, :type => :controller do

  describe "#create" do 

    it "Create session successfully" do
      pass = Faker::Internet.password(8)
      user = create(:user, password: pass)
      post :create, email: user.email, password: pass 
      response.should redirect_to(tasks_path)
    end

    it "Create session fail, Invalid email or password" do
      pass = Faker::Internet.password(8)
      user = create(:user, password: pass)
      bedpass = pass + 'sdsd' + pass
      post :create, email: user.email, password: bedpass 
      response.should render_template('new')
    end

    it "Create session fail, no active code" do
      pass = Faker::Internet.password(8)
      user = create(:user, password: pass, active_code: "sdsd")
      post :create, email: user.email, password: pass 
      response.should render_template('new')
    end
  
  end
end