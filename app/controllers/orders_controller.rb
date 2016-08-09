class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
    @order = Order.find(params[:order_id])
    @order.complete = true
    if @order.save
      flash[:success] = "Checkout Complete!"
      redirect_to "/orders/#{@order.id}"
    else
      render 'edit'
    end
  end

  def edit
  end


end
