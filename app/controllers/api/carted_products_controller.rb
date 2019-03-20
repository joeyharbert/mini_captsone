class Api::CartedProductsController < ApplicationController
  def create
    if current_user
      @carted_product = Cartedproduct.new(user_id: current_user.id, 
        product_id: params[:product_id],
        quantity: params[:quantity],
        status: "carted"
        )

      if @carted_product.save
        render 'show.json.jbuilder'  
      else
        render 'errors.json.jbuilder', status: :unprocessable_entity
      end

    else
      render json: []
    end
  end

  def index
    if current_user
      @carted_products = Cartedproduct.all
      @carted_products = @carted_products.where(user_id: current_user.id).where(status: "carted")

      render 'index.json.jbuilder'
    else
      render json: [], status: :unprocessable_entity
    end
  end
end
