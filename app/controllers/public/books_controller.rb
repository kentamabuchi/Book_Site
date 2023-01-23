class Public::BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to public_books_index_path
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
