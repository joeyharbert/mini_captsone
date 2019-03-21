class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    carted_products = Cartedproduct.all
    carted_products = carted_products.where(user_id: current_user.id).where(status: "carted")
    if carted_products
      subtotal = 0

      carted_products.each do |carted_product|
        product_total = carted_product.product.price * carted_product.quantity
        subtotal += product_total
      end

      tax_rate = 0.10
      tax = subtotal * tax_rate
      total = subtotal + tax
    end

    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
      )
    if order.save
      carted_products.each do |carted_product|
        carted_product.update(order_id: order.id, status: "purchased")          
      end
      render json: {message: 'Order created successfully'}, status: :created
    else
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end

  def index
    @orders = Order.where(user_id: current_user.id)
    render 'index.json.jbuilder'
  end

  def show
    sql = "SELECT id FROM orders
          WHERE user_id = #{current_user.id}
          ORDER BY created_at DESC
          LIMIT 1;"
    temp = ActiveRecord::Base.connection.execute(sql)[0]
    id = temp["id"]

    @order = Order.find(id)
    render 'show.json.jbuilder'
  end
end
