class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index, :topten, :show]
  before_action :set_categories, only: [:edit,:new,:create,:update]
require "awesome_print"

  def topten
    @movies = Movie.all
    @count = {}
    @movies.each_with_index do |movie,i|
      @count[movie.id] = {point: movie.ratings.sum(:point).to_i , movie: movie }
    end

    @count = Hash[@count.sort_by { |k,v| -v[:point] }[0..9]]

  end

  def index
    @movies = Movie.all
  end

  def show
    @rating   = Rating.new
    @rating_count = Rating.where(movie: @movie).sum(:point)
    @comments = Comment.where(movie: @movie)
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
