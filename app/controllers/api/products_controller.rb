class Api::ProductsController < ApplicationController
  def index
    search_term = params[:search]
    discount = params[:discount] == "true" ? true : false
    sort = params[:sort]
    sort_order = params[:sort_order]
    if search_term
      @products = Product.where("name iLIKE ?", "%#{search_term}%")
    else
      @products = Product.all
    end

    if discount
      @products = Product.where("price < 2")
    end

    if sort && sort_order
      @products.order!(sort => sort_order)
    elsif sort
      @products.order!(sort)
    else
      @products.order!(:id)
    end


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
      description: params[:description]
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
      description: params[:description] || @product.description
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
