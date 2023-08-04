class CategoriesController < ApplicationController
  def new
    @category = Category.new
    render :new
  end

  def create
    @category = Category.create(
      category: params[:category],
    )
    redirect_to "/categories"
  end
end
