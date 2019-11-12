class ImagesController < ApplicationController
  before_action :set_image, only: %i[show destroy]

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
      flash[:success] = 'You have successfully added an image.'
      redirect_to @image
    else
      render action: :new
    end
  end

  def destroy
    if @image.destroy
      flash[:success] = 'You have successfully deleted the image.'
      redirect_to images_path
    else
      render action: :show
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
