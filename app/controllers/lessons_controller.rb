class LessonsController < ApplicationController
  def index
    @lessons = Lesson.where(user_id: current_user.id)
  end

  def create
    # Kiểm tra xem request từ web hay là từ mobile
    if params[:lesson][:category_name].nil?
      category_id = params[:lesson][:category_id].to_i
    else
      category_id = Category.find_by(name: params[:lesson][:category_name]).id
    end
    # Kiểm tra xem là request từ web hay là từ mobile
    if params[:email].nil?
      user = current_user
    else
      user = User.find_by(email: params[:email])
    end
    @lesson = Lesson.new(user_id: user.id, category_id: category_id)

    @questions = Set.new

    # Tìm ra những từ đã học
    learned_words = []
    lessons = user.lessons
    lessons.each do |l|
      wl = WordLesson.where(lesson: l)
      wl.each do |w|
        learned_words << w.word_id
      end
    end
    # Lấy ra những từ chưa học
    if learned_words.count == 0
      @words = Word.where(category_id: category_id)
    else
      @words = Word.all.where("category_id = (?) AND id NOT IN (?)",category_id, learned_words)
    end

    # Kiểm tra nếu số từ chưa học nhỏ hơn số từ trong 1 lesson thì fail
    respond_to do |format|
      if @words.count >= 10
        while @questions.count < 10 do
          @questions << @words.sample
        end
        @questions.each do |ques|
          WordLesson.create(word: ques, lesson: @lesson)
        end
        format.html {redirect_to lesson_path(@lesson)}
        format.json {render json: {questions: @questions.map {|question| question.json_data}, id: @lesson.id}, status: :ok}
      else
        format.html {redirect_to categories_path, alert: "Not enough word for you can learn."}
        format.json {render json: {message: "Not enough word"}, status: :unprocessable_entity}
      end
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @wordlessons = WordLesson.where(lesson_id: @lesson.id)
  end

  def update
    @p = params

    @lesson = Lesson.find(params[:id])
    @wordlessons = WordLesson.where(lesson_id: @lesson.id)

    # Ghi ket qua user lam vao db
    @count = 0
    # Tinh so ket qua dung true_answer
    true_answer = 0
    result_detail = []
    @wordlessons.each do |w|
      @count += 1
      if !@p["wordanswer#{@count}"].nil?
        w.answer = WordAnswer.where(id: @p["wordanswer#{@count}"].to_i).first.content
        if w.answer == w.word.word_answers.where(correct: 1).first.content
          true_answer += 1
          result_detail << [w.word.content, w.answer, true]
        else
          result_detail << [w.word.content, w.answer, false]
        end
      end
    end
    # Ghi result vao lesson
    @lesson.result = true_answer
    @lesson.save
    @wordlessons.each do |w|
      w.save
    end
    respond_to do |format|
      format.html {render 'show'}
      format.json {render json: {result: true_answer, result_detail: result_detail}}
    end
  end
end