class ImagesController < ActionController::Base
  def new
    @image = Image.new
  end

  def create
    @image = Image.create(params[:image].permit(:link))
    if @image.valid?
      redirect_to @image
    else
      render 'images/new', status: :unprocessable_entity
    end
  end

  def show
    @image_url = Image.find(params[:id]).link
  end
end
