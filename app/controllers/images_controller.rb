class ImagesController < ApplicationController
  before_action :set_image, only: [:show]

  def index
    @images = Image.order(created_at: :desc)
  end

  def show; end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image
    else
      render action: :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:description, :name, :url)
  end

  def set_image
    @image = Image.find(params[:id])
  end
end
