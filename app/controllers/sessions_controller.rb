class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  end

  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])
    respond_to do |format|
    	if user.nil?
    		@title = "Sign in"
    		format.html {redirect_to signin_path, alert: "Invalid email/password combination."}
        format.json {render json: {user: user}, status: "fail"}
    	else
    		sign_in user
    		format.html {redirect_to user_path(user), notice: "Sign in successfull."}
        format.json {render json: {message: user.errors.full_message}, status: "success"}
    	end
    end
  end

  def destroy
  	sign_out
  	redirect_to signin_path, notice: "Sign out successfull."
  end
end
