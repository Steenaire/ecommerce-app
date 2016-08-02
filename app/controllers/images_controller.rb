class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save

    flash[:success] = "Image Added!"

    redirect_to "/products/#{@image.product.id}"
  end

  private

  def image_params
    params.require(:image).permit(:url, :product_id)
  end

end
