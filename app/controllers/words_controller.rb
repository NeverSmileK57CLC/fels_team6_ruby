class WordsController < ApplicationController
  def index
  	@filter = params

    # Mặc định là All
    @filter[:learned] = '3' if @filter[:learned].nil?
  	if @filter[:category_name].nil? or @filter[:category_name] == "All"
  		@words = Word.all
  	else
  		category_id = Category.find_by(name: params[:category_name]).id
  		@words = Word.where(category_id: category_id)
  	end
    # Nếu người dùng sign in thành công hoặc mobile gửi api lên server
    if signed_in? or !params[:email].nil?
      # Tìm lesson tùy vào việc sign in hay là request từ mobile
      if signed_in?
        lessons = current_user.lessons
      else
        user = User.find_by(email: params[:email])
        lessons = user.lessons
      end
      # Lấy ra id của những từ đã học
      learned_word = []
      if !lessons.nil?
        lessons.each do |lesson|
          wl = WordLesson.where(lesson_id: lesson.id)
          wl.each do |f|
            learned_word << f.word_id
          end
        end
      end

      if @filter[:learned] == '1'
        @words = @words.where("id IN (?)", learned_word)
      elsif @filter[:learned] == '2'
        @words = @words.where("id NOT IN (?)", learned_word) if learned_word.count != 0
      end
    end

  	@categories = Category.all

  	respond_to do |format|
  		format.html {}
  		format.json {render json: {words: @words.map{|word| word.json_data}}, status: :ok}
  	end
  end
end
