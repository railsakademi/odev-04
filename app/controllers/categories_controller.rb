class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy, :edit]
  before_action :authenticate_user!, except:[:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def show
    @movies = @category.movies
  end

  def update
    if @category.update category_params
      redirect_to @category, notice: "Kategori Güncellendi"
    else
      render :edit
    end
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to @category, notice: 'Kategori Oluşturuldu'
    else
      render :new
    end
  end

  def destroy
    #SQL (0.1ms)  DELETE FROM "categories_movies" WHERE "categories_movies"."category_id" = ?  [["category_id", 4]]
    #SQL (0.0ms)  DELETE FROM "categories" WHERE "categories"."id" = ?  [["id", 4]]
    #İlişkiyi Otomatik Olarak Siliyor
    @category.destroy
    redirect_to categories_url, notice: 'Kategori Silindi.'
  end

private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

end
