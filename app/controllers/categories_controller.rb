class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]
  before_action :require_admin, only: [:new, :create]

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

  def show
    @posts = @category.posts
  end

  private

  def set_category
    @category = Category.find_by(slug: params[:id])
  end
end