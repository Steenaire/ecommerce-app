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
  end

  def create
    quantity = params[:quantity].to_i
    subtotal = 0
    tax = 0
    total = 0
    
    order = Order.new(
      quantity: quantity,
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
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
