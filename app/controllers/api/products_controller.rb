class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jbuilder'
  end

  def show
    if params[:id].to_i != 0
      @product = Product.find(params[:id])
    else
      @product = Product.find_by(name: params[:id]) 
    end
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
      name: params[:name], 
      price: params[:price].to_i, 
      description: params[:description],
      image_url: params[:image_url]
      )
    @product.save
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      name: params[:name] || @product.name, 
      price: params[:price] || @product.price, 
      description: params[:description] || @product.description,
      image_url: params[:image_url]
      )
    render 'show.json.jbuilder'
  end

end
