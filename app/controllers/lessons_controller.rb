class LessonsController < ApplicationController
  def index
  end

  def new
  	category_id = params[:category_id].to_i
  	@lesson = Lesson.new(user_id: current_user.id, category_id: category_id)
  	@questions = Set.new
  	@words = Word.all.where(category_id: category_id)
  	while @questions.count < 10 do
  		@questions << @words.sample
  	end

    # @questions.each do |ques|
    #   Lesson
    # end
  end
end
