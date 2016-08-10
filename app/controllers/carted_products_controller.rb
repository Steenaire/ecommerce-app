class CartedProductsController < ApplicationController

  before_action :authenticate_user!

  def index
    orders = current_user.orders
    open_order = nil

    orders.each do |order|
      if !order.complete
        open_order = order
      end
    end

    if open_order
      @carted_products = open_order.carted_products
      @order = open_order
    end

    if !open_order || !@carted_products.first
      flash[:warning] = "Shopping Cart is Empty"
      redirect_to "/"
    end

  end

  def new
  end

  def create
    order = current_user.orders.find_by(complete: false) || Order.create(user_id: current_user.id, complete: false, subtotal: 0, total: 0, tax: 0)
    @carted_product = CartedProduct.new(product_id: params[:product_id], quantity: params[:quantity], order_id: order.id)

    if @carted_product.save

      @carted_product.order.subtotal += (@carted_product.product.price*@carted_product.quantity)
      @carted_product.order.tax += ((@carted_product.product.price*@carted_product.quantity)*0.08)
      @carted_product.order.total += ((@carted_product.product.price*@carted_product.quantity)*1.08)
      @carted_product.order.save

      session[:cart_count] = nil

      flash[:success] = "#{@carted_product.product.name} added to cart!"
      redirect_to "/carted_products/"
    else
      flash[:warning] = "Order not processed"
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def destroy
    order = CartedProduct.find_by(id: params[:id]).order
    carted_product = CartedProduct.find_by(id: params[:id])

    order.subtotal -= (carted_product.product.price*carted_product.quantity)
    order.tax -= ((carted_product.product.price*carted_product.quantity)*0.08)
    order.total -= ((carted_product.product.price*carted_product.quantity)*1.08)
    order.save

    CartedProduct.find_by(id: params[:id]).destroy

    session[:cart_count] = nil

    flash[:warning] = "#{carted_product.product.name} Removed from Shopping Cart"

    redirect_to "/carted_products/"
  end

end
