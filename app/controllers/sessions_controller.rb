class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
   # binding.pry
      
        if user
          if user.active_code == 'active'
            session[:user_id] = user.id
            redirect_to tasks_path, :notice => "Logged in!"
          else
            flash[:notice] = "Go to the post office to activate your account"
            render new_session_path
          end
        else
          render new_session_path
          flash[:notice] = "Invalid email or password"
          #flash.now[:alert] = "Invalid email or password"
          #render new_session_path
        end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
