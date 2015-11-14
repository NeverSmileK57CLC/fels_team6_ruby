class WordsController < ApplicationController
  def index
  	@filter = params
  	@words = Word.all
  	@categories = Category.all
  	respond_to do |format|
  		format.html {}
  		format.json {render json: {words: @words.as_json}, status: :ok}
  	end
  end
end
