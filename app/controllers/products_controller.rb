class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product =  Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Product Created!"
      redirect_to "/products/#{@product.id}"
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    Product.update(@product.id, product_params)
    if @product.save
      flash[:success] = "Product Updated!"
      redirect_to "/products/#{@product.id}"
    else
      render 'edit'
    end
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

  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :image, :quantity, :category)
    end

end
