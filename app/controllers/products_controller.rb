class ProductsController < ApplicationController

  def index
    sort_attribute = params[:sort_attribute]
    if sort_attribute
      @products = Product.order(sort_attribute)
    else
      @products = Product.all
    end

    if params[:search]
      @products = Product.search(params[:search])
    else
      @products = Product.all
    end

    @random_product = @products.sample
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.all
    @random_product = @products.sample
  end

  def new
  end

  def create
    @product = Product.find(params[:id])
    @products = Product.all
    @random_product = @products.sample

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

    @product = Product.find(params[:id])
    @products = Product.all
    @random_product = @products.sample

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

    @product = Product.find(params[:id])
    @products = Product.all
    @random_product = @products.sample
  end

  def destroy
    Product.find_by(id: params[:id]).destroy

    flash[:warning] = "Product Deleted!"

    redirect_to "/products/"
  end

  def search
    @products = Product.all
    @random_product = @products.sample

    if params[:search]
      @products = Product.search(params[:search])
      redirect_to '/products/search'
    else
      @products = Product.all
    end

  end

end
