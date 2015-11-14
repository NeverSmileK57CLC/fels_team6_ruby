class Admin::WordsController < ApplicationController
	def index
		@words = Word.all
	end

	def show
		
	end

	def edit
		
	end
end