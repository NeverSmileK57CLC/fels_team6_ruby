class Admin::WordsController < ApplicationController
	before_action :set_word, only: [:show, :edit, :update, :destroy]
	before_action :check_login
	before_action :check_admin
	def index
		@words = Word.all
	end

	def new
		@word = Word.new
		4.times {@word.word_answers.build}
		@categories = Category.all
	end

	def create
		@correct = params[:word][:correct]
		4.times do |n|
			params[:word][:word_answers_attributes]["#{n}"][:correct] = 0
		end
		params[:word][:word_answers_attributes]["#{@correct}"][:correct] = 1
		@word = Word.create(word_params)
		if !@word.nil?
			redirect_to admin_words_path, notice: "Create word successfully."
		else
			render 'new'
		end
	end

	def show
	end

	def edit
		@categories = Category.all
	end

	def update
		@correct = params[:word][:correct]
		4.times do |n|
			params[:word][:word_answers_attributes]["#{n}"][:correct] = 0
		end
		params[:word][:word_answers_attributes]["#{@correct}"][:correct] = 1
		
		if !@word.update(word_params).nil?
			redirect_to admin_words_path, notice: "Update word successfully."
		else
			render 'edit'
		end
	end

	def destroy
		@word.destroy
		redirect_to admin_words_path, notice: "Delete word successfully."
	end
	private
		def word_params
			params.require(:word).permit(:content, :category_id,
				:word_answers_attributes => [:id, :content, :correct])
		end

		def check_admin
			if current_user.role != "Admin"
				redirect_to home_path, alert: "You do not have permission to access admin."
			end
		end

		def set_word
			@word = Word.find(params[:id])
		end

		def check_login
	  		if current_user.nil?
	  			redirect_to signin_path, alert: "You have to sign in."
	  		end
	  	end
end