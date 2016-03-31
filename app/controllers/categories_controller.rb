class CategoriesController < ApplicationController
  before_action :set_category, only: [:list]

  def list
    @movies = @category.movies
  end

private
  def set_category
    @category = Category.find(params[:id])
  end

end
