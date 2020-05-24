class Admins::GenresController < ApplicationController
  before_action :set_genre, only: [:index, :create, :edit]

  def index
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admins_genre_path
    else
      render "index"
    end
  end

  def edit

  end

  def update

  end

  private

  def set_genre
    genre = genre.find(params[:id])
    @genres = Genre.all
    @new_genre = Genre.new
  end

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end
