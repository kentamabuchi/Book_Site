class Admin::BooksController < ApplicationController

  before_action :authenticate_admin!

  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    Book.find(params[:id]).update(book_params)
    redirect_to admin_books_path
  end

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
