class Public::ReviewsController < ApplicationController


  def show
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    @reviews = @review.replies.all
    @reply = Review.new
  end

  def create
    if params[:parent_id].present?
      @review = current_user.reviews.new(reply_params)
      @review.book_id = params[:book_id]
      if @review.rate.nil?
        @review.rate = 0
      end
      @review.save
      redirect_to book_reviews_path(@review.book_id, @review)
    else
      @review = current_user.reviews.new(review_params)
    end
    @review.book_id = params[:book_id]
    if @review.rate.nil?
      @review.rate = 0
    end
    @review.save
    redirect_to book_path(params[:book_id], anchor: 'bookReview')
  end

  def update
    @review = Review.find(prams[:id])
    @review.update
    redirect_to book_path(params[:book_id], anchor: 'bookReview')
  end

  def destroy
    @review = Review.find_by(id: params[:id], book_id: params[:book_id])
    @review.destroy
    redirect_to book_path(params[:book_id], anchor: 'bookReview')
  end

  private

  def review_params
    params.require(:review).permit(:user_id,
                  :book_id,
                  :parent_id,
                  :comment,
                  :rate,
                  :is_actiive,
                  :created_at,
                  :updated_at)
  end

  def reply_params
    params.permit(:user_id,
                  :book_id,
                  :parent_id,
                  :comment,
                  :rate,
                  :is_actiive,
                  :created_at,
                  :updated_at)
  end

  def good_review_params
    params.require(:good_review).permit(:user_id,
                                        :review_id,
                                        :created_at,
                                        :updated_at)
  end
end
