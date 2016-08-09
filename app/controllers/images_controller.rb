class ImagesController < ApplicationController

  def new
    @image = Image.new
    @product_id = params[:product_id]
  end

  def create
    if current_user.admin  
      @image = Image.new(image_params)
      @image.save

      flash[:success] = "Image Added!"

      redirect_to "/products/#{@image.product.id}"
    else
      flash[:danger] = "Action not permitted"
      redirect_to "/"
    end
  end

  private

  def image_params
    params.require(:image).permit(:url, :product_id)
  end

end
