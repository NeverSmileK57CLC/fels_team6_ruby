class AdminController < ApplicationController
  def index
  	@users = User.all
  end

  def word
  	@words = Word.all
  end

  def category
  	@categories = Category.all
  end
end
