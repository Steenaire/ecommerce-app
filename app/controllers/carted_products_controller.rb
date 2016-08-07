class CartedProductsController < ApplicationController

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

    if !@carted_products.first
      redirect_to "/"
    end

  end

  def new
  end

  def create
    @carted_product = CartedProduct.new(product_id: params[:product_id], quantity: params[:quantity])

    current_user.orders.each do |order|
      if order.complete == false
        @carted_product.order_id = order.id
      end
    end

    if @carted_product.order_id == nil
      new_order = Order.new(user_id: current_user.id, complete: false, subtotal: 0, total: 0, tax: 0)
      new_order.save
      @carted_product.order_id = new_order.id
    end

    if @carted_product.save
      @carted_product.order.subtotal += (@carted_product.product.price*@carted_product.quantity)
      @carted_product.order.tax += ((@carted_product.product.price*@carted_product.quantity)*0.08)
      @carted_product.order.total += ((@carted_product.product.price*@carted_product.quantity)*1.08)
      @carted_product.order.save
      flash[:success] = "Item added to cart!"
      redirect_to "/carted_products/"
    else
      flash[:notice] = "Order not processed"
      render "/products/#{params[:product_id]}"
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

    flash[:warning] = "Item Removed from Shopping Cart!"

    redirect_to "/carted_products/"
  end

end
