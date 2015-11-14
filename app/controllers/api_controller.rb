class ApiController < ApplicationController
  def users
    @users = User.all
    # respond_to do |format|
    #   format.json { render json: @users}
    # end
    render json: @users
  end

  def lessons
    @lessons = Lesson.all
    render json: @lessons
  end

  def categories
    @categories = Category.all
    render json: @categories
  end

  def words
    @words = Word.all
    render json: @words
  end

  def wordanswers
    @wdansers = WordAnswer.all
    render json: @wdansers
  end

  def lessonwords
    @lessonwords = LessonWord.all
    render json: @lessonwords
  end

  def activities
    @activities = Activity.all
    render json: @activities
  end
end
