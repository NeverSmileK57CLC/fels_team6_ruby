class StaticPagesController < ApplicationController
  def home
  	@user = current_user

  	@learned_word = 0
  	lessons = current_user.lessons
  	lessons.each do |lesson|
  		if !lesson.result.nil?
  			@learned_word += lesson.result
  		end
  	end
  end

  def help
  end

  def contact
  end
end
