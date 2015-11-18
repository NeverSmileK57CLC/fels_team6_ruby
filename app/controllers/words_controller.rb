class WordsController < ApplicationController
  def index
  	@filter = params
    @filter[:learned] = '3' if @filter[:learned].nil?
  	if @filter[:category_name].nil? or @filter[:category_name] == "All"
  		@words = Word.all
  	else
  		category_id = Category.find_by(name: params[:category_name]).id
  		@words = Word.where(category_id: category_id)
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

    word_answers = {}
    @words.each do |word|
      word_answers["#{word.id}"] = word.word_answers.where(correct: true).first.content
    end
  	respond_to do |format|
  		format.html {}
  		format.json {render json: {words: @words.as_json, answers: word_answers.as_json}, status: :ok}
  	end
  end
end
