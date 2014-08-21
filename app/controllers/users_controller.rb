class UsersController < ApplicationController
  def new
  @user = User.new
end

def registration_user
    @user = User.find_by_active_code(params[:active_code])
  @user.active_code = 'active'
  if
   @user.save
    redirect_to root_url
  else
    render "new"
  end
  #RegistrationMailer.user_active(@user).deliver
end

def create
	#binding.pry
  @user = User.new(user_param)
  @user.active_code = Digest::MD5.hexdigest @user.email
  if
   @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
  RegistrationMailer.user_active(@user).deliver
end

 private 
 def user_param 
  params.require(:user).permit(:email, :fname, :lname, :password, :password_confirmation, :age) 
 end 

end





