class CategoriesController < ApplicationController
  def new
    @category = Category.new
    render :new
  end

  def create
    @category = Category.create(
      name: params[:name],
    )
    redirect_to "/categories"
  end
end
