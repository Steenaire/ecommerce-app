class ImagesController < ApplicationController

  def new
  end

  def create
    image = Image.new({image_params})
    image.product_id = product.id
    image.save

    flash[:success] = "Image Added!"

    redirect_to "/products/#{product.id}"
  end

  private

  def image_params
    params.require(:image).permit(:url, :product_id)
  end

end
