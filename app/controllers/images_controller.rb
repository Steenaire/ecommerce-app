class ImagesController < ApplicationController

  def new
    @image = Image.new
    @product_id = params[:product_id]
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
