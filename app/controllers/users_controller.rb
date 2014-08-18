class UsersController < ApplicationController
  def new
  @user = User.new
end

def create
	#binding.pry
  @user = User.new(user_param)
  if
   @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
end

 private 
 def user_param 
  params.require(:user).permit(:email, :fname, :lname, :password, :password_confirmation, :age) 
 end 

end
