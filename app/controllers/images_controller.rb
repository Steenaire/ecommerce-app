class ImagesController < ApplicationController

  def new
  end

  def create
    image = Image.new({
      url: params[:url]
      product_id: product.id
      })
    product.save

    flash[:success] = "Image Added!"

    redirect_to "/products/#{product.id}"
  end

end
