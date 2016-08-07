class CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.all
  end

  def new
  end

  def create

    @carted_product = CartedProduct.new(product_id: params[:product_id], quantity: params[:quantity], order_id: params[:order_id])
    subtotal = 0

    @carted_product.order.subtotal += (@carted_product.product.price*@carted_product.quantity)
    @carted_product.order.tax += (@carted_product.order.subtotal*0.08)
    @carted_product.order.total += (@carted_product.order.subtotal+@carted_product.order.tax)

  end

end
