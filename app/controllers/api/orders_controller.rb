class Api::OrdersController < ApplicationController
  def create
    if current_user
    product = Product.find(params[:product_id])
    if product
      price = product.price
      subtotal = price * params[:quantity].to_i
      tax_rate = 0.10
      tax = subtotal * tax_rate
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

  def show
    if current_user
      sql = "SELECT id FROM orders
            WHERE user_id = #{current_user.id}
            ORDER BY created_at DESC
            LIMIT 1;"
      temp = ActiveRecord::Base.connection.execute(sql)[0]
      id = temp["id"]

      @order = Order.find(id)
      render 'show.json.jbuilder'
    else
      render json: []
    end
  end
end
