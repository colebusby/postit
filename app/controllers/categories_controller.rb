class CategoriesController < ApplicationController
before_action :require_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit!)
    if @category.save
      flash[:notice] = "The #{@category.name} category has been created."
      redirect_to posts_path
    else
      #handle validations
      render :new
    end
  end
end