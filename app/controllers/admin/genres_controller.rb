class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to genres_path(anchor: 'genre_anchor')
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to genres_path(anchor: 'genre_anchor')
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path(anchor: 'genre_anchor')
  end

  private

  def genre_params
    params.require(:genre).permit(:name,
                                  :created_at,
                                   :updated_at)
  end
end
