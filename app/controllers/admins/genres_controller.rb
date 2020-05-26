class Admins::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @new_genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admins_genres_path
    else
      render "index"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    if genre.update(genre_params)
      redirect_to admins_genres_path
    else
      @genre = Genre.find(params[:id])
      render "edit"
    end
  end

  private


  def genre_params
    params.require(:genre).permit(:title, :status)
  end

end
