class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @rating = Rating.new rating_params
    @rating.user_id = current_user.id
    if @rating.save
      redirect_to movie_path(@rating.movie_id), notice: "Oyunuz kaydedildi"
    else
      redirect_to root_path
    end
  end

  def destroy
    @rating.destroy
  end

private

  def set_movie
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:movie_id , :point)
  end
end
