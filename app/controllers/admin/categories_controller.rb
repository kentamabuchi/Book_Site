class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path(anchor: 'category_anchor')
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path(anchor: 'category_anchor')
  end

  private

  def category_params
    params.require(:category).permit(:name,
                                     :create_at,
                                     :updated_at)
  end
end
