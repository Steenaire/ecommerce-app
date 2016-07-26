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

    redirect_to "/products/#{product.id}"
  end

  def update
    @name = params[:name]
    @price = params[:price]
    @description = params[:description]
    @image = params[:image]
    @quantity = params[:quantity]
    @category = params[:category]
    @id = params[:id]

    product = Product.find(params[:id])

    product.name = @name
    product.price = @price
    product.description = @description
    product.image = @image
    product.quantity = @quantity
    product.category = @category
    product.save

    redirect_to "/products/#{@id}"
  end

  def edit
    @id = params[:id]
    @product = Product.find(@id)
  end

  def destroy
    Product.find_by(id: params[:id]).destroy
    redirect_to "/products/"
  end

end
