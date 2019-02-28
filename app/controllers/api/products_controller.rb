class Api::ProductsController < ApplicationController
  def all_products
    @products = Product.all
    render 'all_products.json.jbuilder'
  end

  def show
    if params[:id].to_i != 0
      @product = Product.find(params[:id])
    else
      @product = Product.find_by(name: params[:id]) 
    end
    render 'product.json.jbuilder'
  end

end
