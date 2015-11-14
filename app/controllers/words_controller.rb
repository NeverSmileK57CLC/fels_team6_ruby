class WordsController < ApplicationController
  def index
  	@filter = params
  	if !@filter[:category_id].nil?
  		@words = Word.all.where(category_id: params[:category_id])
  	else
  		@words = Word.all
  	end
  	@categories = Category.all

  	respond_to do |format|
  		format.html {}
  		format.json {render json: {words: @words.as_json}, status: :ok}
  	end
  end
end
