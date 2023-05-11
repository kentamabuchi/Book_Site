class Public::FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    current_user.favorites.create(book_id: params[:book_id])
  end

  def destroy
    @book = Book.find(params[:book_id])
    Favorite.find_by(user_id: current_user.id, book_id: params[:book_id]).destroy

  end

  private
  def favorite_params
    params.require(:favirite).permit(:id,
                                     :user_id,
                                     :book_id,
                                     :created_at,
                                     :updated_at)
  end
end
