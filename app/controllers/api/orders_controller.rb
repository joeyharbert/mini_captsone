class Api::OrdersController < ApplicationController
  def create
    if current_user
    product = Product.find(params[:product_id])
    if product
      price = product.price
      subtotal = price * params[:quantity].to_i
      tax = subtotal * 0.10
      total = subtotal + tax   
    end

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
      )
      if order.save
        render json: {message: 'Order created successfully'}, status: :created
      else
        render json: {errors: order.errors.full_messages}, status: :bad_request
      end
    else
      render json: []
    end
  end

  def index
    if current_user
      @orders = Order.where(user_id: current_user.id)
      render 'index.json.jbuilder'
    else
      render json: []
    end
  end
end
