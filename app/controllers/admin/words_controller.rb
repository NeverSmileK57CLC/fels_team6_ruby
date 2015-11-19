class Admin::WordsController < ApplicationController
	before_action :set_word, only: [:show, :edit, :update, :destroy]
	before_action :check_admin
	def index
		@words = Word.all
	end

	def new
		@word = Word.new
	end

	def show
	end

	def edit
		
	end
	private
		def check_admin
			if current_user.role != "Admin"
				redirect_to home_path, alert: "You do not have permission to access admin."
			end
		end

		def set_word
			params.require(:word).permit(:content, :category_id)
end