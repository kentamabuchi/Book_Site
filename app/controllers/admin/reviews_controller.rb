class Admin::ReviewsController < ApplicationController

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to report_reviews_path
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
