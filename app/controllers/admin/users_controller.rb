class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update(user_params)
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:id,
                                 :name,
                                 :email,
                                 :image,
                                 :introduce,
                                 :is_active,
                                 :created_at,
                                 :updated_at)
  end

end