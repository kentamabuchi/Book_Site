class Public::GoodReviewsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:review_id])
    current_user.good_reviews.create(review_id: params[:review_id])
  end

  def destroy
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:review_id])
    GoodReview.find_by(user_id: current_user.id, review_id: params[:review_id]).destroy
  end

  private
  def good_review_params
    params.require(:good_review).permit(:user_id,
                                        :review_id,
                                        :created_at,
                                        :updated_at)
  end
end
