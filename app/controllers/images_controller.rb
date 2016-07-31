class ImagesController < ApplicationController

  def new
  end

  def create
    image = Image.new({product_params})
    image.product_id = product.id
    product.save

    flash[:success] = "Image Added!"

    redirect_to "/products/#{product.id}"
  end

  private

  def product_params
    params.require(:image).permit(:url, :product_id)
  end

end
