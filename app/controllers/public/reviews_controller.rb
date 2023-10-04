class Public::ReviewsController < ApplicationController


  def show
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    @reviews = @review.replies.all
    @reply = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.book_id = params[:book_id]
    if @review.rate.nil?
      @review.rate = 0
    end
    @review.save
    redirect_to book_path(params[:book_id], anchor: 'bookReview')
  end

  def reply
    @review = Review.find(params[:parent_id])
    @reply = current_user.reviews.new(review_params)
    @reply.save
    redirect_to book_review_path(@review.book_id, @review)
  end

  def edit
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to book_path(params[:book_id], anchor: 'bookReview')
  end

  def destroy
    @review = Review.find_by(id: params[:id], book_id: params[:book_id])
    @review.destroy
    if request.referer.include?("admins")
      redirect_to report_reviews_path
    else
      redirect_to book_path(params[:book_id], anchor: 'bookReview')
    end
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

end
