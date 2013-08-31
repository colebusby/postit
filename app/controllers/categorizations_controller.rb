class CategorizationsController < ApplicationController

  def create
    #binding.pry
    params[:category_ids].each do |cat_id|
      categorization = Categorization.new(category_id: cat_id, post_id: params[:post_id])
      categorization.save
    end
    redirect_to posts_path

  end

  def destroy
    #binding.pry
    categorization = Categorization.find(params[:id])
    categorization.delete
    redirect_to posts_path
  end

end