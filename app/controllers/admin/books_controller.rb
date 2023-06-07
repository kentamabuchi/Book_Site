class Admin::BooksController < ApplicationController

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to report_books_path
  end

  private

  def book_params
    params.require(:book).permit(:createUser_id,
                                 :category_id,
                                 :genre_id,
                                 :name,
                                 :writer,
                                 :image,
                                 :content,
                                 :edit_status,
                                 :is_active,
                                 :create_at,
                                 :updated_at)
  end
end
