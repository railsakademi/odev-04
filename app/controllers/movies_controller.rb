class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_categories, only: [:edit,:new,:create,:update]

  def index
    @movies = Movie.all
  end

  def show
    @rating   = Rating.new
    @rating_count = Rating.all.where(movie: @movie).sum(:point)
    @comments = Comment.all.where(movie: @movie)
    @comment  = Comment.new
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private

    def set_categories
      @categories = Category.all
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :director, :country, :date, :image, :youtube, {:category_ids => []})
    end
end
