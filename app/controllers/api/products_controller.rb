class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'all_products.json.jbuilder'
  end

  def show
    @product = Product.find(params[:id])
    render 'product.json.jbuilder'
  end
end
