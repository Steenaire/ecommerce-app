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
    elsif params[:category_id]
      @products = Category.find_by(id: params[:category_id]).products
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
    @product.images.build
  end

  def create
    if current_user.admin
      @product = Product.new(product_params)
      @product.supplier_id = params[:supplier][:supplier_id]

      if @product.save
        # binding.pry
        flash[:success] = "Product Created!"
        redirect_to "/products/#{@product.id}"
      else
        flash[:notice] = "Product not created"
        puts "below"
        p @product.errors
        render 'new'
      end

    else
      flash[:danger] = "Action not permitted"
      redirect_to "/"
    end
  end

  def update
    if current_user.admin  
      @product = Product.find(params[:id])
      Product.update(@product.id, product_params)
      @product.supplier_id = params[:supplier][:supplier_id]
      if @product.save
        flash[:success] = "Product Updated!"
        redirect_to "/products/#{@product.id}"
      else
        render 'edit'
      end
    else
      flash[:danger] = "Action not permitted"
      redirect_to "/"
    end
  end

  def edit
    @id = params[:id]
    @product = Product.find(@id)
  end

  def destroy
    if current_user.admin
      Product.find_by(id: params[:id]).destroy

      flash[:warning] = "Product Deleted!"

      redirect_to "/products/"
    else
      flash[:danger] = "Action not permitted"
      redirect_to "/"
    end
  end

  def search
    if params[:search]
      @products = Product.search(params[:search])
      render :index
    else
      @products = Product.all
    end
  end

  private

    def product_params
      params.require(:product).permit(
        :name,
        :price,
        :description,
        :available,
        :quantity,
        :supplier_id,
        images_attributes: [:id, :url]
        )
    end

end
