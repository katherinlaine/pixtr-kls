class ImagesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.build(image_params)
    @image.user = current_user

    if @image.save
      redirect_to(gallery_path(@gallery))
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @gallery = Gallery.find(params[:gallery_id])
    if @image.update(image_params)
      redirect_to gallery_image_path(@gallery, @image)
    else
      render :edit
    end
  end

  def destroy
    @gallery = Gallery.find(params[:gallery_id])
    image = @gallery.images.find(params[:id])
    image.destroy

    redirect_to gallery_path(@gallery)
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :url)
  end
end
