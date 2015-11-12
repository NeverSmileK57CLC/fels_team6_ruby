class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  end

  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	if user.nil?
  		@title = "Sign in"
  		redirect_to signin_path, notice: "Invalid email/password combination."
  	else
  		sign_in user
  		redirect_to user_path(user), notice: "Sign in successfull."
  	end
  end

  def destroy
  	sign_out
  	redirect_to signin_path, notice: "Sign out successfull."
  end
end
