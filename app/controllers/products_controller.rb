class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
    @name = params[:name]
    @price = params[:price]
    @description = params[:description]
    @image = params[:image]
    @quantity = params[:quantity]
    @category = params[:category]

    product = Product.new({
      name: @name, price: @price, description: @description, image: @image, quantity: @quantity, category: @category
      })
    product.save
  end

end
