class MoviesController < ApplicationController

  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  def new

    @watchlist = Watchlist.find_by_id(params[:watchlist_id])
    @movie = Movie.new

  end

  def create

    @movie = Movie.new(movie_params)
    @watchlist = Watchlist.find_by_id(params[:movie][:watchlist_id])
    if @movie.save
      redirect_to @movie.watchlist
    else
      render :new
    end
  end

  def edit

  end

  def update
    @movie.update(movie_params)
    if @movie.save
      # flash[:message] = "#{@movie.title} has been updated"
      redirect_to user_watchlist_path(@movie.watchlist.user, @movie.watchlist)
    else
      render :edit
    end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to user_watchlist_path(current_user, params[:watchlist_id])
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :genre, :description, :year, :watchlist_id)
  end

  def set_movie
    @movie = Movie.find_by(id: params[:id])
  end

end
