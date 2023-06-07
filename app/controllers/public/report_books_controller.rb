class Public::ReportBooksController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    current_user.report_books.create(book_id: params[:book_id])
  end

  private
  def report_book_params
    params.require(:report_book).permit(:id,
                                        :user_id,
                                        :book_id,
                                        :created_at,
                                        :updated_at)
  end
end
