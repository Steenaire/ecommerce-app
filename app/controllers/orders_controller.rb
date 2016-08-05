class OrdersController < ApplicationController

  def index
    if current_user
      @orders = Order.where(user_id: current_user.id)
    else
      flash[:danger] = "Log In To See Order History"
      redirect_to "/login"
    end
  end

  def new
    order = Order.new
    product = Product.find_by(id: params[:id])
  end

  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    
    order = Order.new(
      quantity: quantity,
      product_id: product.id,
      user_id: current_user.id,
      subtotal: (quantity*product.price),
      tax: 0.08,
      total: (quantity*product.price)*(1.08),
      )

    if order.save
      flash[:success] = "Your Order Has Been Submitted!"
      redirect_to "/orders/#{order.id}"
    else
      flash[:notice] = "Order not processed"
      render "/products/#{product.id}"
    end

  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
