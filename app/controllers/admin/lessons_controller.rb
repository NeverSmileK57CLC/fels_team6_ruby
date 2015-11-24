class Admin::LessonsController < ApplicationController
	before_action :set_lesson, only: [:show, :destroy]
	def index 
		@lessons = Lesson.all
	end

	def show
	end

	def destroy
		@lesson.destroy
		redirect_to admin_lessons_path, notice: "Delete lesson successfully."
	end

	private
		def set_lesson
			@lesson = Lesson.find(params[:id])
		end
end