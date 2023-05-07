class Public::BooksController < ApplicationController
  protect_from_forgery

  def index
    @books = Book.all
    @follow_books = Book.follow_book_ranking(current_user) if user_signed_in?
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews.all.reverse_order
    @review = Review.new
    if @book.reviews.blank?
      @average_rate = 0
    else
      @average_rate = @book.reviews.average(:rate).round(1)
    end
  end

  def new
    @book = Book.new
    @categories = Category.all
    @genres = Genre.all
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
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
