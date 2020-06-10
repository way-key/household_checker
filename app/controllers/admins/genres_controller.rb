class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.page(params[:page]).per(20)
    @new_genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admins_genres_path
    else
      @genres = Genre.page(params[:page]).per(20)
      @new_genre = Genre.new
      flash.now[:alert] = 'ジャンル名が空欄です'
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
      flash.now[:alert] = 'ジャンル名が空欄です'
      render "edit"
    end
  end

  private


  def genre_params
    params.require(:genre).permit(:title, :status)
  end

end
