class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all

    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
      @current_category = Category.find(params[:category_id])
    end

    if params[:filter] == "on_sale"
      @products = @products.where(is_on_sale: true)
    elsif params[:filter] == "new"
      @products = @products.where(is_new: true)
    end

    if params[:search].present?
      @products = @products.where(
        "name LIKE ? OR description LIKE ?",
        "%#{params[:search]}%",
        "%#{params[:search]}%"
      )
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end