class Public::RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.relationships.create({followed_id: @user.id})
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.relationships.find_by(followed_id: @user.id).destroy
  end

  def follow
    @follow = User.find(params[:id]).followings
  end

  def follower
    @follower = User.find(params[:id]).followers
  end

  def my_follow
    @follow = current_user.followings
  end

  def my_follower
    @follower = current_user.followers
  end

  private

  def relationships_params
    params.require(:relationship).permit(:followed_id,
                                         :follower_id,
                                         :created_at,
                                         :updated_at)
  end
end
