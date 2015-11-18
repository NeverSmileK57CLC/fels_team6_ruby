class Admin::UsersController < ApplicationController
	before_action :check_admin
	def index
		@users = User.all
	end

	private
		def check_admin
			if current_user.role != "Admin"
				redirect_to home_path, alert: "You do not have permission to access admin."
			end
		end
end