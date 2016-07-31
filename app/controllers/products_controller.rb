class ProductsController < ApplicationController

  def index
    if params[:sort_attribute]
      @products = Product.order(price: params[:sort_attribute])
    elsif params[:search]
      @products = Product.search(params[:search])
      if !@products.any?
        flash[:warning] = "No products match your search"
      end
    elsif params[:discount]
      @products = Product.where("price < ?", 15)
    else
      @products = Product.all
    end
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find(params[:id])
    end
  end

  def new
    @product =  Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      # image = Image.new(product_id: product.id, url: image_url)
      # image.save
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

  def search
    # @products = Product.where("name ILIKE ? OR description ILIKE ? OR category ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
    # render :index
  end

  private

    def product_params
      params.require(:product).permit(:name, :price, :description, :image, :quantity, :category, :supplier_id)
    end

end
