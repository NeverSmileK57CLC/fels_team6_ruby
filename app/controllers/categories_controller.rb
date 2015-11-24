class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.html {}
      format.json {render json: {categories: @categories}, status: :ok}
    end
  end
end
