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
      price: params[:price], 
      description: params[:description],
      image_url: params[:image_url]
      )
    
    if @product.save
      render 'show.json.jbuilder'  
    else
      render 'errors.json.jbuilder', status: :unprocessable_entity
    end
    
  end

  def update
    @product = Product.find(params[:id])
    updates = {
      name: params[:name] || @product.name, 
      price: params[:price] || @product.price, 
      description: params[:description] || @product.description,
      image_url: params[:image_url]
      }
    
    if @product.update(updates)
      render 'show.json.jbuilder'  
    else
      render 'errors.json.jbuilder', status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render 'destroy.json.jbuilder'
  end

end
