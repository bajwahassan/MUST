class WatchlistsController < ApplicationController
  before_action :require_login


  def index
    @watchlists = current_user.watchlists
  end

  def new
    @watchlist = Watchlist.new
  end

  def create
    @watchlist = current_user.watchlists.build(watchlist_params)
    if @watchlist.save
      redirect_to user_watchlists_path(@user)
    else
      render :new
    end
  end

  def show
    @watchlist = Watchlist.find_by_id(params[:id])
    unless @watchlist.user == current_user
      redirect_to user_watchlists_path
    end
  end

  def sort_year
    @movies = Watchlist.find_by_id(params[:format]).movies.by_year
    render :sorted_watchlist
  end


  private
  def watchlist_params
    params.require(:watchlist).permit(:name, :description, :user_id)
  end

end
