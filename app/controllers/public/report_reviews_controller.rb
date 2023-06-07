class Public::ReportReviewsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @book = Book.find(params[:book_id])
    current_user.report_reviews.create(review_id: params[:review_id])
  end

  private
  def report_review_params
    params.require(:report_review).permit(:id,
                                          :user_id,
                                          :review_id,
                                          :created_at,
                                          :updated_at)
  end
end
