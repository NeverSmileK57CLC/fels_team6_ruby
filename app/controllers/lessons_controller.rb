class LessonsController < ApplicationController
  def index
  end

  def new
    # @questions.each do |ques|
    #   Lesson
    # end
  end

  def create
    category_id = params[:lesson][:category_id].to_i
    @lesson = Lesson.new(user_id: current_user.id, category_id: category_id)
    @questions = Set.new

    # Tìm ra những từ đã học
    learned_words = []
    lessons = current_user.lessons
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
    if @words.count >= 10
      while @questions.count < 10 do
        @questions << @words.sample
      end
      @questions.each do |ques|
        WordLesson.create(word: ques, lesson: @lesson)
      end
      redirect_to lesson_path(@lesson)
    else
      redirect_to categories_path, alert: "Not enough word for you can learn."
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
    @wordlessons.each do |w|
      @count += 1
      if !@p["wordanswer#{@count}"].nil?
        w.answer = WordAnswer.where(id: @p["wordanswer#{@count}"].to_i).first.content
        if w.answer == w.word.word_answers.where(correct: 1).first.content
          true_answer += 1
        end
      end
    end
    # Ghi result vao lesson
    @lesson.result = true_answer
    @lesson.save
    @wordlessons.each do |w|
      w.save
    end
    render 'show'
  end
end