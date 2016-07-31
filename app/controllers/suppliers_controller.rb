class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
    supplier = Supplier.new({
      name: params[:name]
      email: params[:email]
      phone: params[:phone]
      })
    product.save

    flash[:success] = "Suuplier Created!"

    redirect_to "/suppliers/#{supplier.id}"
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update

    supplier = Supplier.find(params[:id])

    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.phone = params[:phone]

    product.save

    flash[:success] = "Supplier Updated!"

    redirect_to "/suppliers/#{@id}"
  end

  def destroy
    Supplier.find_by(id: params[:id]).destroy

    flash[:warning] = "Supplier Deleted!"

    redirect_to "/suppliers/"
  end

end
