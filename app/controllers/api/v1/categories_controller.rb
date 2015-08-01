class Api::V1::CategoriesController < ApplicationController
  respond_to :json

  def create
    category = Category.create(category_params)
    respond_with :api, :v1, category
  end

  def index
    respond_with Category.all
  end

  def show
    respond_with Category.find(params[:id])
  end

  def destroy
    respond_with Category.destroy(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
