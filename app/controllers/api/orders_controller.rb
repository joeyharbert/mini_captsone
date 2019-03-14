class Api::OrdersController < ApplicationController
  def create
    if current_user
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
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
end
