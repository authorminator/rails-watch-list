class ListsController < ApplicationController
  def index
    @lists = List.all
    @movies = Movie.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks.includes(:movie)
    # @list_movie_titles = []
    # @list.bookmarks.movies = @list.movies
    # @list.bookmarks.movies.each { |movie| @list_movie_titles << movie}
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
