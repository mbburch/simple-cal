class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:edit, :update]

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to dashboard_path
      flash[:notice] = "Category was created successfully."
    else
      flash.now[:error] = "Couldn't create category."
      render :new
    end
  end

  def edit
    @category
  end

  def update
    if @category.update(category_params)
      redirect_to dashboard_path
      flash[:notice] = "Category was updated successfully."
    else
      flash.now[:error] = "Couldn't update category."
      render :edit
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:id, :name, :color)
  end
end