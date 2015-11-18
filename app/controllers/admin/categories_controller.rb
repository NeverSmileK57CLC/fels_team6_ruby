class Admin::CategoriesController < ApplicationController
	before_action :check_admin
	def index
		@categories = Category.all
	end
	private
		def check_admin
			if current_user.role != "Admin"
				redirect_to home_path, alert: "You do not have permission to access admin."
			end
		end
end