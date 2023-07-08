class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def report_books
    @books = ReportBook.all
  end

  def report_reviews
    @reviews = ReportReview.all
  end

  private

  def report_book_params
    params.require(:report_book).permit(:id,
                                        :user_id,
                                        :book_id,
                                        :created_at,
                                        :updated_at)
  end

  def report_book_params
    params.require(:report_review).permit(:id,
                                        :user_id,
                                        :review_id,
                                        :created_at,
                                        :updated_at)
  end
end
