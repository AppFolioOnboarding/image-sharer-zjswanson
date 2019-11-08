class ImagesController < ApplicationController
  before_action :set_image, only: [:show]

  def index
    all_images = Image.includes(:tags).order(created_at: :desc)
    tagged_images = all_images.tagged_with(params[:tag_filter]) if params[:tag_filter].present?

    @images = tagged_images.presence || all_images
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
    params.require(:image).permit(:description, :name, :url, :tag_list)
  end

  def set_image
    @image = Image.find(params[:id])
  end
end
