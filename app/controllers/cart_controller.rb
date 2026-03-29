class CartController < ApplicationController
  def show
    @cart_items = get_cart_items
    @total = @cart_items.sum { |item| item[:product].price * item[:quantity] }
  end

  def add
    product = Product.find(params[:id])
    session[:cart] ||= {}
    session[:cart][params[:id]] ||= 0
    session[:cart][params[:id]] += (params[:quantity] || 1).to_i
    redirect_to products_path, notice: "#{product.name} added to cart!"
  end

  def update
    session[:cart] ||= {}
    quantity = params[:quantity].to_i
    if quantity > 0
      session[:cart][params[:id]] = quantity
    else
      session[:cart].delete(params[:id])
    end
    redirect_to cart_path, notice: "Cart updated!"
  end

  def remove
    session[:cart] ||= {}
    session[:cart].delete(params[:id])
    redirect_to cart_path, notice: "Item removed from cart!"
  end

  private

  def get_cart_items
    return [] unless session[:cart].present?
    session[:cart].map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product
      { product: product, quantity: quantity }
    end.compact
  end
end
