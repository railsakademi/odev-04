class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :authenticate_user!, except:[:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @movies = @category.movies
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to @category, notice: 'Kategori Oluşturuldu'
    else
      render :new
    end
  end

private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

end
