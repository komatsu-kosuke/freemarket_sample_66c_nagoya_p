class HomesController < ApplicationController

  def index
    @product_image = ProductsImage.all
    # @products_images = Products_images.all
    # @products_image.image="#{@product.id}.jpg"
    # image=params[:image_file]
    # File.binwrite("public/#{@user.image_name}", image.read)
  end

  def show
  end

  def new
  end

  def profile
  end
  
  def logout
  end

  def credit
  end

  def credit_register
  end

  def listings
  end

  def listing
  end
  
end
