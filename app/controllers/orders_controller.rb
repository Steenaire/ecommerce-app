class OrdersController < ApplicationController

  def index
    if current_user
      @orders = Order.where(user_id: current_user.id)
    else
      flash[:danger] = "Log In To See Order History"
      redirect_to "/login"
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
    if current_user
      @order = Order.find(params[:order_id])
      @order.complete = true
      if @order.save
        flash[:success] = "Checkout Complete!"
        redirect_to "/orders/#{@order.id}"
      else
        render 'edit'
      end
    end
  end

  def edit
  end


end
