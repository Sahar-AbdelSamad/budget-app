class CategoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @user = current_user
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = Category.new(category_params)
    @category.author_id = @user.id
    respond_to do |format|
      if @category.save!
        format.html do
          redirect_to categories_path, notice: 'Category created successfully!'
        end
      else
        format.html { redirect_to new_category_path, alert: 'Failed to create category' }
      end
    end
  end

  private

  def category_params
    params.require(:categories).permit(:name, :icon)
  end
end
