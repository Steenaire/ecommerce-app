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
    product = Product.new({
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image],
      quantity: params[:quantity],
      category: params[:category],
      available: params[:available]
      })
    product.save

    flash[:success] = "Product Created!"

    redirect_to "/products/#{product.id}"
  end

  def update
    @id = params[:id]

    product = Product.find(params[:id])

    product.name = params[:name]
    product.price = params[:price]
    product.description = params[:description]
    product.image = params[:image]
    product.quantity = params[:quantity]
    product.category = params[:category]
    product.available = params[:available]
    product.save

    flash[:success] = "Product Updated!"

    redirect_to "/products/#{@id}"
  end

  def edit
    @id = params[:id]
    @product = Product.find(@id)
  end

  def destroy
    Product.find_by(id: params[:id]).destroy

    flash[:warning] = "Product Deleted!"

    redirect_to "/products/"
  end

end
