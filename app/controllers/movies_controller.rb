class MoviesController < ApplicationController

  def index
    if params[:sort_title] == "title"
      @movies = Movie.order("title ASC")
      @color_title = "highlight"
    elsif params[:sort_date] == "date"
      @movies = Movie.order("release_date ASC")
      @color_date = "highlight"
    else
      @movies = Movie.all
    end
    @all_ratings = %w{G PG PG-13 NC-17 R}
  end

  def show
    @movie = find_movie
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new movie_params
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_url
    else
      render 'new'
    end
  end

  def edit
    @movie = find_movie
  end

  def update
    @movie = find_movie
    if @movie.update_attributes(movie_params)
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = find_movie
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_url
  end

  def order
    @movies = Movie.all
  end

  private

  def find_movie
    Movie.find(params[:id])
  end

  def movie_params
    params[:movie].permit(:title, :rating, :release_date, :description)
  end

end

