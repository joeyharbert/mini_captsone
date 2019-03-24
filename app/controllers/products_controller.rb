class ProductsController < ApplicationController
  def index
    @products = Product.all

    render 'index.html.erb'
  end

  def show
    @product = Product.find(params[:id])

    render 'show.html.erb'
  end

  def new
    @suppliers = Supplier.all
    render 'new.html.erb'
  end

  def create
    @product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description],
      supplier_id: params[:supplier_id]
      )
    
    @product.save

    if params[:images].include?(',')
      images = params[:images].split(', ')
      images.each do |url|
        Image.create(url: url, product_id: @product.id)
      end

    elsif params[:images] != ""
      Image.create(url: params[:images], product_id: @product.id)
    end

    redirect_to "/products/#{@product.id}"
  end

  def edit
    @product = Product.find(params[:id])
    @suppliers = Supplier.all
    render 'edit.html.erb'
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      name: params[:name], 
      price: params[:price], 
      description: params[:description],
      supplier_id: params[:supplier_id]
      )
    i = 0
    @product.images.each do |image|
      image.update(url: params["image_#{i}"])
      i += 1
    end

    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy

    redirect_to "/products"
  end
end
