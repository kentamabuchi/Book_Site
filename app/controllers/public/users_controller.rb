class Public::UsersController < ApplicationController
  def mypage
    @user = User.find(current_user.id)
    @follow = @user.followings
    @follower = @user.followers
    @reviews = @user.reviews.where(parent_id: nil).reverse_order.limit(5)
  end

  def show
    @user = User.find(params[:id])
    @follow = @user.followings
    @follower = @user.followers
    @reviews = @user.reviews.where(parent_id: nil).reverse_order.limit(5)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update
    redirect_to mypage_path
  end



  private

  def users_params
    params.require(:user).permit(:name,
                                :email,
                                :image,
                                :introduce,
                                :is_active,
                                :created_at,
                                :updated_at)
  end
end


