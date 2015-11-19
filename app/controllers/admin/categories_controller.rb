class Admin::CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	before_action :check_admin
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
	  	@category = Category.new(category_params)

	    if @category.save
	    	redirect_to admin_categories_path, notice: "Create category successfully."
	    else
	    	render 'new'
	    end
  	end

  	def show
  	end

  	def edit
  	end

  	def update
  		if @category.update(category_params)
  			redirect_to admin_categories_path, notice: "Update category successfully."
  		else
  			render 'edit'
  		end
  	end

	def destroy
		@category.destroy
		redirect_to admin_categories_path, notice: "Delete category successfully."
	end

	private
		def check_admin
			if current_user.role != "Admin"
				redirect_to home_path, alert: "You do not have permission to access admin."
			end
		end

		def category_params
			params.require(:category).permit(:name, :description)
		end

		def set_category
			@category = Category.find(params[:id])
		end
end