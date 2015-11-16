class WordsController < ApplicationController
  def index
  	@filter = params
    @filter[:learned] = '3' if @filter[:learned].nil?
  	if !@filter[:category_id].nil?
  		@words = Word.all.where(category_id: params[:category_id])
  	else
  		@words = Word.all
  	end

    if signed_in?
      lessons = current_user.lessons
      if !lessons.nil?
        learned_word = []
        lessons.each do |lesson|
          wl = WordLesson.where(lesson_id: lesson.id)
          wl.each do |f|
            learned_word << f
          end
        end
      end
      learned_word_id = []
      learned_word.each do |l|
        learned_word_id << l.word_id
      end
      if @filter[:learned] == '1'
        @words = @words.where("id IN (?)", learned_word_id)
      elsif @filter[:learned] == '2'
        @words = @words.where("id NOT IN (?)", learned_word_id)
      end
    end
    #if @filter[:learned] == '1'


  	@categories = Category.all

  	respond_to do |format|
  		format.html {}
  		format.json {render json: {words: @words.as_json}, status: :ok}
  	end
  end
end
